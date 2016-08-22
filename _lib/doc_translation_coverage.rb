#!/usr/bin/env ruby

require 'csv'
require 'fileutils'
require 'yaml'

require_relative './languages.rb'

def get_location_section_from_path(file_path)
    split_path = file_path.split('/')

    location = split_path[-2]
    section = split_path[-1].split(".")[0]
    
    return location, section
end

def sluggify(string)
    slug = string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')    
    return slug
end

def generate_translation_coverage(file_path)
    location, section = get_location_section_from_path(file_path)

    target_language_codes = LANGUAGE_CODES.keys

    file_data = YAML.load_file(file_path)
    document_metas = []

    docs = file_data["docs"]
    if docs
        for doc in docs
            document_name = doc["name"]

            document_meta = [location, file_data["title"], document_name]

            for language in target_language_codes
                if doc["languages"].include?(language)
                    document_meta << "True"
                else
                    document_meta << "False"
                end
            end
            document_metas << document_meta
        end
    end
    return document_metas

end


CSV.open("_locations/translation_coverage.csv", "w") do |csv|
    header = ["Location", "Section", "Document Name"]
    header = header + LANGUAGE_CODES.values
    csv << header

    Dir.glob('_data/**/*.yaml') do |file_path|

        document_metas = generate_translation_coverage file_path

        for document_meta in document_metas
            csv << document_meta
        end

    end
end

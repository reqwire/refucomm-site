#!/usr/bin/env ruby

require 'fileutils'
require 'yaml'

def get_location_section_from_path(file_path)
    split_path = file_path.split('/')

    location = sluggify(split_path[-2])
    section = sluggify(split_path[-1].split(".")[0])
    
    return location, section
end

def sluggify(string)
    slug = string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')    
    return slug
end

def rename_pdf(file_dir, language, location, section, document_name)
    if Dir.glob("#{file_dir}*.pdf").count == 1
        new_file_name = "#{location}_#{section}_#{document_name}_#{language.upcase}.pdf"
        
        Dir.glob("#{file_dir}*.pdf") do |file_path|
            new_file_path = (file_path.split("/")[0..-2] + [new_file_name]).join("/")
            if new_file_path != file_path
                FileUtils.mv(file_path, new_file_path)
            end
        end
    end
end


def generate_dirs_from_yaml(file_path)
    location, section = get_location_section_from_path(file_path)

    file_data = YAML.load_file(file_path)

    docs = file_data["docs"]
    if docs
        for doc in docs
            document_name = sluggify(doc["name"])
            for language in doc["languages"]
                language = sluggify(language)
                infopack_document_dir = "infopacks/#{location}/#{section}/#{document_name}/#{language}/"

                FileUtils.mkdir_p(infopack_document_dir)
                rename_pdf(infopack_document_dir, language, location, section, document_name)
            end
        end
    end
end


Dir.glob('_data/locations/*.yaml') do |file_path|
  generate_dirs_from_yaml file_path
end

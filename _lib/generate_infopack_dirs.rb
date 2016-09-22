#!/usr/bin/env ruby

require 'fileutils'
require 'yaml'

def get_location_from_path(file_path)
    split_path = file_path.split('/')

    location = split_path[-1].split('.')[0]
    
    return location
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
    location = sluggify(get_location_from_path(file_path))

    file_data = YAML.load_file(file_path)

    for section in file_data['sections']
        section_name = sluggify(section['title'])
        for link in section['links']
            if link['type'] == "pdf"
                link_name = sluggify(link['name'])
                for language in link['languages']
                    lang = sluggify(language)
                    infopack_document_dir = "infopacks/#{location}/#{section_name}/#{link_name}/#{lang}/"
                    FileUtils.mkdir_p(infopack_document_dir)
                    
                    rename_pdf(infopack_document_dir, lang, location, section_name, link_name)
                end
            end
        end
    end
end


Dir.glob('_data/locations/*.yaml') do |file_path|
  generate_dirs_from_yaml file_path
end

#!/usr/bin/env ruby

require 'fileutils'
require 'yaml'

def get_location_section_from_path(file_path)
    split_path = file_path.split('/')

    location = split_path[-2]
    section = split_path[-1].split(".")[0]
    
    return location, section
end


def generate_csv_of_docs(file_path)
    location, section = get_location_section_from_path(file_path)

    file_data = YAML.load_file(file_path)

    docs = file_data["docs"]
    if docs
        for doc in docs
            document_name = doc["name"]
            puts [section,document_name].join(",")
        end
    end
end


Dir.glob('_data/**/*.yaml') do |file_path|
  generate_csv_of_docs file_path
end

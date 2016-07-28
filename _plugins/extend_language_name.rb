module Jekyll
    module Iso639

        def extend_language_code(input)
            codes = {
                "en" => "English",
                "fr" => "French",
                "fa" => "Farsi",
            }
            extended = codes[input]
            return extended
        end

    end
end

Liquid::Template.register_filter(Jekyll::Iso639)
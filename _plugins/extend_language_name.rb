module Jekyll
    module Iso639

        def extend_language_code(input)
            codes = {
                "ar" => "Arabic",
                "en" => "English",
                "el" => "Greek",
                "fa" => "Farsi",
                "fr" => "French",
                "kmj" => "Kurmanji",
                "ku" => "Sorani (Kurdish)",
                "pa" => "Pasto",
                "ur" => "Urdu",
            }
            extended = codes[input]
            if extended
                return extended
            else
                return input
            end
        end

    end
end

Liquid::Template.register_filter(Jekyll::Iso639)
module Jekyll
    class ShowTitle < Liquid::Tag
        def initialize(tag_name, input, tokens)
            @title = input
        end

        def render(context)
            return "foo - #{@title} - foo"
        end

    end
end

Liquid::Template.register_tag('show_title', Jekyll::ShowTitle)

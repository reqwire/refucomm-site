module Jekyll
    class ShowTitle < Liquid::Tag
        def initialize(tag_name, input, tokens)
            @section = input.strip
        end

        def render(context)
            title = context.registers[:site].data['locations']['greece-mainland'][@section]['title']
            return "<h2>#{title}</h2><ul><li><a>Helo</a></li></ul>"
        end

    end
end

Liquid::Template.register_tag('show_title', Jekyll::ShowTitle)

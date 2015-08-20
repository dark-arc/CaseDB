module ApplicationHelper
  
  def initMarkdown()
    options = {
      filter_html: true,
      no_styles: true,
      safe_links_only: true,
    }

    extensions = {
    
    }

    renderer = Redcarpet::Render::HTML.new(options)
    return Redcarpet::Markdown.new(renderer, extensions)
  end
  
  def markdown(text)
    @markdown ||= initMarkdown
    @markdown.render(text).html_safe unless
      text == nil
  end

  def icon(name,alt)
    image_tag("icons/#{name}.svg", alt: alt, class: 'icon' )
  end
end

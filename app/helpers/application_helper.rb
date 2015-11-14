module ApplicationHelper
  # Initializes an instance of markdown and returns it. This should
  # never be called directly as creating the renderer will slow down
  # the application, use [markdown] instead.
  #
  # @return [Redcarpet::Markdown] markdown renderer.
  def initMarkdown()
    options = {
      html_filter: true,
      no_styles: true,
      safe_links_only: false,
      models: {
        Event => :date,
        CaseFile => :name,
        Person => :name
      },
      link: /<(.*)\?(.*)>/
    }

    extensions = {
    
    }

    renderer = Formatter.new(options)
    return Redcarpet::Markdown.new(renderer, extensions)
  end
  # Renders a piece of text given in the parameters as markdown
  # code. This also calls initMarkdown and caches the renderer which
  # should speed up calls to markdown.
  #
  # @param text [String] Any string, preferably one with markdown in it.
  # @return [String] Markdown formatted string
  def markdown(text)
    return "" if text.nil?
    @markdown ||= initMarkdown
    text = @markdown.render(text) || ""
    text.html_safe
  end

  # @return [Boolean] true when there is a user signed in. 
  def signed_in?
    if ! session[:user_id].nil?
      true
    else
      false
    end
  end
  
  # @return [String] the name of the current user
  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  # Gets the title of the current page. This is used by the layout
  # engine and probably shouldn't be called elsewhere.
  #
  # @return the page title
  def get_title
    title = "CaseDB"
    if content_for? :title
      title+= " #{content_for :title}"
    end
    return title
  end

  # Returns the current style. This is used by the layout engine and
  # shouldn't be called elsewhere.
  #
  # @return the current style for this user
  def get_style
    theme = 'themes/wine'
    theme = "themes/#{current_user.theme}" unless
      current_user.nil? or current_user.theme.nil?
    return theme
  end
  # Returns a default title for the page, this will usually be
  # "controller_action" and an attempt will be made to localise the
  # string. To override this title for a page define content for
  # :title anywhere in the page.
  #
  # @return default title for this page  
  def title
    return t("headers.#{controller_name}.#{action_name}")
  end
end

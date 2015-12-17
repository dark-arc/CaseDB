# Helper method for all Views
module ApplicationHelper
  # @return [Boolean] true when there is a user signed in.
  def signed_in?
    if !session[:user_id].nil?
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
  # @return the page title
  def title
    return "CaseDB - #{content_for :title}" if content_for? :title
    default_title
  end

  # Returns the current style. This is used by the layout engine and
  # shouldn't be called elsewhere.
  # @return the current style for this user
  def style
    theme = 'themes/wine'
    theme = "themes/#{current_user.theme}" unless
      current_user.nil? || current_user.theme.nil?
    theme
  end

  # Returns a default title for the page, this will usually be
  # "controller_action" and an attempt will be made to localise the
  # string. To override this title for a page define content for
  # :title anywhere in the page.
  # @return default title for this page
  def default_title
    t("headers.#{controller_name}.#{action_name}")
  end
end

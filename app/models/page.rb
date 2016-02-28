# The page class represents this site's static content. This will
# allow the site to be updated easier as users can manipulate content
# on the Home, About and Help pages without rebuilding the site.
class Page < StaticModel::Base
  include ActiveModel::Conversion
  # @!attribute [r] name
  # The name of the page, this is how the controller will find the
  # article. For Home and About this is hardcoded. For the Help pages
  # this will be the controller name.

  # @!attribute [r] text
  # The text of the page. This will be a markdown document.
end

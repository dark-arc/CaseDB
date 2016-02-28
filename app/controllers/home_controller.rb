# This represents the home / about and help pages, these are all
# static content
class HomeController < ApplicationController
  def about
    @text = Page.find_by_name('about')
  end

  def index
    @text = Page.find_by_name('home')
  end
end

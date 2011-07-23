class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :determine_pages

  private
  def determine_pages
    @pages = Page.all 
  end
  
end

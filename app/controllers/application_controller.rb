class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :determine_pages
  helper_method :logged_in?

  private
  def determine_pages
    @pages = Page.all 
  end

  def logged_in?
    user_signed_in?
  end
end

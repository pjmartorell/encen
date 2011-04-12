class PagesController < ApplicationController
  def show
    @page_content = PageContent.find_by_url params[:page]
    unless @page_content
      raise ActionController::RoutingError, "invalid route"
      return
    end
    @key = @page_content.key
  end
end

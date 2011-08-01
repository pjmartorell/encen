class PagesController < ApplicationController
  def show
    @page_content = PageContent.find_by_url params[:page]
    unless @page_content
      raise ActionController::RoutingError, "Pagina no trobada"
      return
    end
    @page = @page_content.page
  end
end

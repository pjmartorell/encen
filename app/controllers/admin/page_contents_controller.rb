class Admin::PageContentsController < Admin::AdminController
  def edit
    @page_content = PageContent.find params[:id]
    @page = @page_content.page
  end

  def update

  end
end


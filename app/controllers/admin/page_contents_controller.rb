class Admin::PageContentsController < Admin::AdminController
  def edit
    @page_content = PageContent.find params[:id]
    @page = @page_content.page
  end

  def update
    @page_content = PageContent.find params[:id]
    @page = @page_content.page

    if @page_content.update_attributes params[:page_content]
      redirect_to admin_pages_url
    else
      render :action => :edit
    end
  end
end


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

  def new
    @page = Page.find params[:page_id]
    @page_content = @page.page_contents.new
  end

  def create
    @page = Page.find params[:page_id]
    @page_content = @page.page_contents.build params[:page_content]

    if @page_content.save
      redirect_to admin_pages_url
    else
      render :action => :new
    end
  end

  def destroy
    @page_content = PageContent.find params[:id]
    @page_content.destroy
    redirect_to admin_pages_url
  end
end


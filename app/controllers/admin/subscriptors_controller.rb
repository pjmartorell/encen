class Admin::SubscriptorsController < Admin::AdminController
  def index
    @subscriptors = Subscriptor.all
  end

  def destroy
    @subscriptor = Subscriptor.find params[:id]
    @subscriptor.destroy

    redirect_to admin_subscriptors_url
  end
end

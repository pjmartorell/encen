class SubscriptorsController < ApplicationController
  def create
    @subscriptor = Subscriptor.new params[:subscriptor]

    if @subscriptor.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
end

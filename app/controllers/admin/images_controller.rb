class Admin::ImagesController < ApplicationController
  def create
    @owner = get_owner
    @image = @owner.images.build(params[:image])
    @image.save

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

   def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.js
    end
  end

private
  def get_owner
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end

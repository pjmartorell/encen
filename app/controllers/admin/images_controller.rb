class Admin::ImagesController < ApplicationController

  def create
    @image = Image.new(params[:image])
    @post = Post.find(params[:post_id])
    @image.post = @post
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
end

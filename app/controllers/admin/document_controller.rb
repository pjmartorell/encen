class Admin::DocumentsController < ApplicationController
  def create
    @owner = get_owner
    @document = @owner.documents.build(params[:doc])
    @document.save

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy

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

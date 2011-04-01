class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.save
    flash[:notice] = "Thanks for commenting!"

    respond_to do |format|
      format.html { redirect_to(@post) }
      format.xml  { render :xml => @post }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Gràcies pel teu comentari!"
    else
      flash[:alert] = "Verifica que has omplert tots els camps correctament."
    end
    respond_to do |format|
      format.html { redirect_to(@post) }
      #format.xml  { render :xml => @post }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_path) }
      #format.xml  { head :ok }
      format.js
    end
  end
end

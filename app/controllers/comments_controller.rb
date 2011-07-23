class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Gràcies per comentar!"
    else
      flash[:alert] = "Hi ha errors al comentari i no es publicarà. Verifica que has omplert TOTS els camps correctament."
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

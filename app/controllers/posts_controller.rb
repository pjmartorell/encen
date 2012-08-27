class PostsController < ApplicationController
  def index
    @posts = Post.paginate :page => params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])  
    @comment = Comment.new  #Humanizer params passing 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
end

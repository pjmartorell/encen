class StaticController < ApplicationController

  def index
    @posts = Post.published.limit(10)
  end

  def noticias
    @posts = Post.published
  end

end

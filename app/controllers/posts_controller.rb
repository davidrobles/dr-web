class PostsController < ApplicationController

  def index
    @posts  = Post.order('created_at DESC').page(params[:page])
  end

  def show
    @post = Post.find_by_slug(params[:id])
  end

end

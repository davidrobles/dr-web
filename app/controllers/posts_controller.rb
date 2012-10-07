class PostsController < ApplicationController

  def index
    @posts  = Post.published.order('created_at DESC').page(params[:page])
  end

  def show
    @post = Post.find_by_slug(params[:id])
    redirect_to root_path unless @post.published
  end

end

class PostsController < ApplicationController

  def index
    # @posts = Post.paginate page: params[:page], per_page: 20, order: 'created_at DESC'
    @posts  = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

end

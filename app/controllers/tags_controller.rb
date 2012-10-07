class TagsController < ApplicationController

  def show
    @tag = Tag.find_by_slug(params[:id])
    @posts  = Post.tagged_with(params[:id]).order('created_at DESC').page(params[:page])
  end

end

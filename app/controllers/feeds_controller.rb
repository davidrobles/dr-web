class FeedsController < ApplicationController

  def posts
    @posts = Post.published.order("updated_at, created_at").limit(10)
  end

end

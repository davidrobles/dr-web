class FeedsController < ApplicationController

  # session :off

  def posts
    @posts = Post.order("updated_at, created_at").limit(15)
    puts '*' * 100
  end

end

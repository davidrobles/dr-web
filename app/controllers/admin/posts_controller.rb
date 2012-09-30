class Admin::PostsController < Admin::AdminController

  def create
    @post = Post.create(params[:post])
    if @post.save
      redirect_to admin_post_path(@post)
    else
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.order('created_at DESC').page(params[:page])
  end

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_post_path(@post)
    else
      render :edit
    end
  end

end

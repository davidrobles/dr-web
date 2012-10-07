class Admin::TagsController < Admin::AdminController

  def create
    @tag = Tag.create(params[:tag])
    if @tag.save
      redirect_to admin_tag_path(@tag)
    else
      render :new
    end
  end

  def destroy
    Tag.find_by_slug(params[:id]).destroy
    redirect_to admin_tags_path
  end

  def edit
    @tag = Tag.find_by_slug(params[:id])
  end

  def index
    @tags = Tag.order('created_at DESC').page(params[:page])
  end

  def new
    @tag = Tag.new
  end
  
  def show
    @tag = Tag.find_by_slug(params[:id])
  end

  def update
    @tag = Tag.find_by_slug(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to admin_tag_path(@tag)
    else
      render :edit
    end
  end

end

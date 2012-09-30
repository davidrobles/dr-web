class Admin::ProjectsController < Admin::AdminController

  def create
    @project = Project.create(params[:project])
    if @project.save
      redirect_to admin_project_path(@project)
    else
      render :new
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to admin_projects_path
  end

  def edit
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.order('created_at DESC').page(params[:page])
  end

  def new
    @project = Project.new
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to admin_project_path(@project)
    else
      render :edit
    end
  end

end

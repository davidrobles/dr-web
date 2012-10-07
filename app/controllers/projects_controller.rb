class ProjectsController < ApplicationController

  def index
    @projects = Project.page(params[:page])
  end

  def show
    @project = Project.find_by_slug(params[:id])
  end

end

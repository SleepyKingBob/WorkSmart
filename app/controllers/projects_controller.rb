class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  def show; end

  def index
    @projects = current_user.projects.where(completed: false)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end

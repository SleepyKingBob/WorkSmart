class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show destroy]

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
    if @project.save
      redirect_to new_project_task_path(@project.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :dead_line, :expected_hours)
  end
end

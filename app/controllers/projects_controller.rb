class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show destroy]

  def show
    @tasks = @project.tasks.sort_by { |task| task[:id] }
    @completed_tasks = @project.tasks.where(completed: true)
    if @completed_tasks == []
      @percentage = 0
    else
      @percentage = ((@completed_tasks.count.to_f / @project.tasks.count) * 100).to_i
    end
  end

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

  def set_active
    @projects = current_user.projects
    @projects.each do |project|
      project.update_attribute(:active, false)
    end
    @project = Project.find(params[:project_id])
    @project.update_attribute(:active, true)
    redirect_to dashboard_path
  end

 

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :dead_line, :expected_hours, :active)
  end
end

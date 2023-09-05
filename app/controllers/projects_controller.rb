class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show destroy]
  before_action :set_project_id, only: %i[set_active unmark_active complete incomplete]


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

  def index_complete
    @projects = current_user.projects.where(completed: true)
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
    @project.update_attribute(:active, true)
    @project.update_attribute(:start_count, DateTime.now)
    redirect_to dashboard_path
  end

  def unmark_active
    @project.update_attribute(:active, false)
    @project.update_attribute(:end_count, DateTime.now)
    hours = (((@project.end_count - @project.start_count) / 60) / 60)
    @project.hours_worked = @project.hours_worked + hours
    @project.save
    redirect_to dashboard_path
  end

  def complete
    @project.update_attribute(:completed, true)
    redirect_to completed_projects_path
  end

  def incomplete
    @project.update_attribute(:completed, false)
    redirect_to projects_path
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_project_id
    @project = Project.find(params[:project_id])
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :dead_line, :expected_hours, :active)
  end
end

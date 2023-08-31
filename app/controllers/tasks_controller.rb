class TasksController < ApplicationController
  before_action :set_project, only: %i[new create destroy]
  before_action :set_task, only: %i[destroy checkbox]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      redirect_to new_project_task_path(@project.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project.id), status: :see_other
  end

  def checkbox
    @task.completed = !@task.completed
    @task.save
    redirect_to project_path(@task.project.id)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end

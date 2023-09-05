class PagesController < ApplicationController
  before_action :set_user, only: %I[dashboard]
  before_action :set_project, only: %i[calendar]
  def home
    redirect_to dashboard_path if !current_user.nil? && !current_user.first_name.nil?
  end

  def calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    @projects = Project.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  
  def dashboard
    @unfinished_projects = @user.projects.where(completed: false)
    @prioritised_projects = @unfinished_projects.sort_by { |project| project[:dead_line] }
    @active_project = @user.projects.find { |project| project[:active] == true }
    if @prioritised_projects.nil? || @prioritised_projects.empty?
      @prioritised_project_completed = []
    else
      @prioritised_project_completed = @prioritised_projects.first.tasks.where(completed: true)
    end
    if @active_project.nil?
      @active_project_completed = []
    else
      @active_project_completed = @active_project.tasks.where(completed: true)
    end
    if @prioritised_project_completed == []
      @prioritised_project_percentage = 0
    else
      @prioritised_project_percentage = ((@prioritised_project_completed.count.to_f / @prioritised_projects.first.tasks.count) * 100).to_i
    end
    if @active_project_completed == []
      @active_project_percentage = 0
    else
      @active_project_percentage = ((@active_project_completed.count.to_f / @active_project.tasks.count) * 100).to_i
    end
  end


  def settings; end

private

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.all
  end

end

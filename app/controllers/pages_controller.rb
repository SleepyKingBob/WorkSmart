class PagesController < ApplicationController
  before_action :set_user, only: %I[dashboard]

  def home
    redirect_to dashboard_path if !current_user.nil? && !current_user.first_name.nil?
  end

  def dashboard
    @prioritised_projects = @user.projects.sort_by { |project| project[:dead_line] }
    @active_project = @user.projects.find { |project| project[:active] == true }
    if @prioritised_projects.nil? || @prioritised_projects.empty?
      @prioritised_project_completed = []
    else
      @prioritised_project_completed = @prioritised_projects.first.tasks.where(completed: true)
    end
    if @active_projects.nil?
      @active_project_completed = []
    else
      @active_project_completed = @active_projects.tasks.where(completed: true)
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

  private

  def set_user
    @user = current_user
  end
end

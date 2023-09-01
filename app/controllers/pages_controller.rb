class PagesController < ApplicationController
  before_action :set_user, only: %I[dashboard]

  def home
    redirect_to dashboard_path if current_user != nil && current_user.first_name != nil
    # redirect_to onboard_path if current_user != nil && current_user.first_name == nil
  end

  def dashboard
    @prioritised_projects = @user.projects.sort_by { |project| project[:dead_line] }
    @active_project = @user.projects.find { |project| project[:active] == true }
    
  end

  private

  def set_user
    @user = current_user
  end
end

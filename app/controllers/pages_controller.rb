class PagesController < ApplicationController
  before_action :set_user, only: %I[dashboard]

  def home
  end

  def dashboard
    @prioritised_projects = @user.projects.sort_by { |project| project[:dead_line] }
    @active_project = @user.projects.find { |project| project[:active] == true }
  end

  private

  def set_user
    # @user = current_user
    @user = User.find(1)
  end
end

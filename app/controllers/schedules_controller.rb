class SchedulesController < ApplicationController
  before_action :set_schedule, only: %I[show destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user
    if @schedule.save
      redirect_to dashboard_path, notice: "schedule was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @schedule.destroy
    redirect_to profile_schedules_path(current_user.id)
  end

  private

  def set_schedule
    @schedule = schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :lunch_break)
  end

end

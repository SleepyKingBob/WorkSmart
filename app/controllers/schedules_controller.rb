class SchedulesController < ApplicationController
  before_action :set_schedule, only: %I[show destroy edit update]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def show
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

  def edit; end

  def update
    @schedule.update(update_schedule_params)

    if @schedule.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.text { render partial: "pages/schedule", locals: { user: current_user }, formats: [:html] }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :lunch_break)
  end

  def update_schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :lunch_break)
  end
end

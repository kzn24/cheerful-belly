class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules.includes(:drug, :supplement).order(start_date: :asc)
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)
    if @schedule.save
      redirect_to main_index_path, notice: "スケジュールの登録ができました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :end_date, :drug_id, :supplement_id).merge(user_id: current_user.id)
  end
end

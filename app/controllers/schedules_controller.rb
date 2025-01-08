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
      redirect_to user_main_index_path, notice: "スケジュールの登録ができました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit
    @schedule = current_user.schedules.find(params[:id])
  end

  def update
    @schedule = current_user.schedules.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to user_schedules_path(current_user), notice: "スケジュールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = current_user.schedules.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to user_schedules_path(current_user), notice: "スケジュールを削除しました" }
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :end_date, :drug_id, :supplement_id).merge(user_id: current_user.id)
  end
end

class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.new(record_params)
    if @record.save
      redirect_to main_index_path, notice: "記録の登録ができました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def record_params
    params.require(:record).permit(:record_date, :poop_rating, :belly_rating, :meal_rating, :condition_rating).merge(user_id: current_user.id)
  end
end

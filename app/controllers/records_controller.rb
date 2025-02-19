class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.new(record_params)

    if @record.save
      redirect_to user_main_index_path, notice: "記録の登録ができました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @record = current_user.records.find(params[:id])
  end

  def edit
    @record = current_user.records.find(params[:id])
  end

  def update
    @record = current_user.records.find(params[:id])
    if @record.update(record_params)
      redirect_to user_main_index_path, notice: "記録を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record = current_user.records.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to user_main_index_path, notice: "記録を削除しました", status: :see_other }
    end
  end

  private

  def record_params
    params.require(:record).permit(
      :record_date, :poop_rating, :belly_rating, :meal_rating, :condition_rating,
      :food, :meal_memo, :diary, :poop_memo, defecation: [], poop_amount: [], poop_shape: []
    ).tap do |whitelisted|
      # 配列をカンマ区切りの文字列に変換（reject(&:blank?)はnil対策）
      whitelisted[:defecation] = whitelisted[:defecation].reject(&:blank?).join(",") if whitelisted[:defecation].is_a?(Array)
      whitelisted[:poop_amount] = whitelisted[:poop_amount].reject(&:blank?).join(",") if whitelisted[:poop_amount].is_a?(Array)
      whitelisted[:poop_shape] = whitelisted[:poop_shape].reject(&:blank?).join(",") if whitelisted[:poop_shape].is_a?(Array)
    end
  end
end

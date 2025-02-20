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

    # 文字列で保存されているデータを配列に戻しインスタンス変数に格納
    @selected_defecation = @record.defecation.present? ? @record.defecation.split("，") : []
    @selected_poop_amount = @record.poop_amount.present? ? @record.poop_amount.split("，") : []
    @selected_poop_shape = @record.poop_shape.present? ? @record.poop_shape.split("，") : []
    @selected_belly_condition = @record.belly_condition.present? ? @record.belly_condition.split("，") : []
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

  # 配列のまま受け取り、ストロングパラメータの許可後に文字列に変換させる
  def record_params
    params.require(:record).permit(
      :record_date, :poop_rating, :belly_rating, :meal_rating, :condition_rating, :food, :meal_memo, :diary, :poop_memo, :belly_memo,
      defecation: [], poop_amount: [], poop_shape: [], belly_condition: []
    ).tap do |params|
      params[:defecation] = params[:defecation].reject(&:blank?).join("，") if params[:defecation].is_a?(Array)
      params[:poop_amount] = params[:poop_amount].reject(&:blank?).join("，") if params[:poop_amount].is_a?(Array)
      params[:poop_shape] = params[:poop_shape].reject(&:blank?).join("，") if params[:poop_shape].is_a?(Array)
      params[:belly_condition] = params[:belly_condition].reject(&:blank?).join("，") if params[:belly_condition].is_a?(Array)
    end
  end
end

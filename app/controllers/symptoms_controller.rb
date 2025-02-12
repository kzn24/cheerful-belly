class SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[ edit update destroy ]

  def index
    @symptom = Symptom.new
    @symptoms = current_user.symptoms.all
  end

  def edit
    @symptom = Symptom.find(params[:id])
  end

  def create
    symptom_names = params[:symptom][:symptom_name]

    if Symptom.symptom_save(current_user, symptom_names)
      redirect_to user_symptoms_path(current_user), notice: "症状を登録しました。"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @symptom = current_user.symptoms.find(params[:id])
    if @symptom.update(symptom_params)
      redirect_to user_symptoms_path(current_user)
    else
      render :edit, status: :unprocessable_entity
      flash[:alert] = "症状の登録に失敗しました。入力内容を確認してください。"
    end
  end

  def destroy
    @symptom = current_user.symptoms.find(params[:id])
    @symptom.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to user_symptoms_path(current_user), notice: "#{symptom.symptom_name}の症状を削除しました。", status: :see_other }
    end
  end

  private

    def set_symptom
      @symptom = Symptom.find(params[:id])
    end

    def symptom_params
      params.require(:symptom).permit(:symptom_name)
    end
end

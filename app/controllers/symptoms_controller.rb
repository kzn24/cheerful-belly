class SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[ show edit update destroy ]

  # GET /symptoms or /symptoms.json
  def index
    @symptom = Symptom.new
    @symptoms = current_user.symptoms.all
  end

  # GET /symptoms/1 or /symptoms/1.json
  def show; end

  # GET /symptoms/new
  def new; end

  # GET /symptoms/1/edit
  def edit
    @symptom = Symptom.find(params[:id])
  end

  def create
    symptom_names = params[:symptom][:symptom_name]

    if Symptom.symptom_save(current_user, symptom_names)
      redirect_to symptoms_path, notice: "症状を登録しました。"
    else
      flash.now[:alert] = "登録に失敗しました。入力内容をご確認ください。"
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /symptoms/1 or /symptoms/1.json
  def update
    @symptom = current_user.symptoms.find(params[:id])
    if @symptom.update(symptom_params)
      redirect_to symptoms_path
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
      format.html { redirect_to symptoms_path, notice: "症状を削除しました。" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symptom
      @symptom = Symptom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def symptom_params
      params.require(:symptom).permit(:symptom_name)
    end
end

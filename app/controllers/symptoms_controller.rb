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
    respond_to do |format|
      if @symptom.update(symptom_params)
        format.html { redirect_to @symptom, notice: "Symptom was successfully updated." }
        format.json { render :show, status: :ok, location: @symptom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symptoms/1 or /symptoms/1.json
  def destroy
    @symptom.destroy!

    respond_to do |format|
      format.html { redirect_to symptoms_path, status: :see_other, notice: "Symptom was successfully destroyed." }
      format.json { head :no_content }
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

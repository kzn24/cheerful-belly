class SupplementsController < ApplicationController
  before_action :set_supplement, only: [ :edit, :update ]

  def edit
    @supplement = Supplement.find(params[:id])
  end

  def update
    @supplement = current_user.supplements.find(params[:id])
    if @supplement.update(supplement_params)
      redirect_to user_drug_supplement_lists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supplement = current_user.supplements.find(params[:id])
    @supplement.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to user_drug_supplement_lists_path(current_user), notice: "#{supplement.supplement_name}を削除しました。", status: :see_other }
    end
  end

  private

  def set_supplement
    @supplement = current_user.supplements.find(params[:id])
  end

  def supplement_params
    params.require(:supplement).permit(:supplement_name)
  end
end

class SupplementsController < ApplicationController
  before_action :set_supplement, only: [ :edit, :update ]

  def edit
    @supplement = Supplement.find(params[:id])
  end

  def update
    @supplement = current_user.supplements.find(params[:id])
    if @supplement.update(supplement_params)
      redirect_to drug_supplement_lists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_supplement
    @supplement = current_user.supplements.find(params[:id])
  end

  def supplement_params
    params.require(:supplement).permit(:supplement_name)
  end
end

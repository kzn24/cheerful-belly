class DrugsController < ApplicationController
  before_action :set_drug, only: [:edit, :update] # ログインしているユーザが登録している薬を取得し、editとupdateでのみ使えるようにしている。

  def edit
    @drug = Drug.find(params[:id])
  end

  def update
    @drug = current_user.drugs.find(params[:id])
    if @drug.update(drug_params)
      redirect_to drug_supplement_lists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_drug
    @drug = current_user.drugs.find(params[:id])
  end

  def drug_params
    params.require(:drug).permit(:drug_name)
  end
end

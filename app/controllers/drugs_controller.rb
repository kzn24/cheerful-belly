class DrugsController < ApplicationController
  before_action :set_drug, only: [ :edit, :update ] # ログインしているユーザが登録している薬を取得し、editとupdateでのみ使えるようにしている。

  def edit
    @drug = Drug.find(params[:id])
  end

  def update
    @drug = current_user.drugs.find(params[:id])
    if @drug.update(drug_params)
      redirect_to user_drug_supplement_lists_path(current_user)
    else
      render :edit, status: :unprocessable_entity
      flash[:alert] = "お薬の登録に失敗しました。入力内容を確認してください。"
    end
  end

  def destroy
    @drug = current_user.drugs.find(params[:id])
    @drug.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to user_drug_supplement_lists_path(current_user), notice: "お薬を削除しました。", status: :see_other }
    end
  end

  private

  def set_drug
    @drug = current_user.drugs.find(params[:id])
  end

  def drug_params
    params.require(:drug).permit(:drug_name)
  end
end

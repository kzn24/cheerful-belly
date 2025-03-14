class DrugSupplementListsController < ApplicationController
  def index
    # Formオブジェクトを使用してフォームを表示
    @drug_supplement_form = DrugSupplementForm.new
    # 一覧表示
    @drugs = current_user.drugs.all
    @supplements = current_user.supplements.all
  end

  def create
    @drug_supplement_form = DrugSupplementForm.new(drug_supplement_form_params)
    @drug_supplement_form.user_id = current_user.id

    if @drug_supplement_form.save
      redirect_to user_drug_supplement_lists_path(current_user), notice: "お薬とサプリメントの登録ができました。"
    else
      @drugs = current_user.drugs
      @supplements = current_user.supplements
      flash.now[:alert] = "登録できませんでした。入力内容を確認してください。"
      render :index
    end
  end

  private

  def drug_supplement_form_params
    params.require(:drug_supplement_form).permit(:drug_name, :supplement_name)
  end
end

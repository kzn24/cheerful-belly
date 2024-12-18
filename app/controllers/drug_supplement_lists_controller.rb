class DrugSupplementListsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Formオブジェクトを使用してフォームを表示
    @drug_supplement_form = DrugSupplementForm.new
    # 一覧表示
    @drugs = current_user.drugs
    @supplements = current_user.supplements
  end

  def create
    @drug_supplement_form = DrugSupplementForm.new(drug_supplement_form_params)
    @drug_supplement_form.user_id = current_user.id
    if @drug_supplement_form.save
      redirect_to drug_supplement_lists_path, notice: 'お薬とサプリメントの登録ができました。'
    else
      @drugs = current_user.drugs
      @supplements = current_user.supplements
      flsh.now[:alert] = '登録できませんでした。入力内容を確認してください。'
      render :index
    end
  end

  private

  def drug_supplement_form_params
    params.require(:drug_supplement_form).permit(:drug_name, :supplement_name)
  end

end

class DrugSupplementForm
  include ActiveModel::Model # モデルの機能をインクルードしてモデル化させる
  include ActiveModel::Attributes # データ型をもつattributes（カラム的なの）を定義できるようにする

  # 扱う属性（カラム）とデータ型を指定する
  attr_accessor :drug_name, :string
  attr_accessor :supplement_name, :string
  attr_accessor :user_id, :integer # アソシエーションを定義できないため、属性として指定することでアソシエーションとする。

  # バリデーション
  validates :drug_name, presence: true, if: -> { supplement_name.blank? } # サプリ名が未入力の場合、薬名が必須
  validates :supplement_name, presence: true, if: -> { drug_name.blank? } # 薬名が未入力の場合サプリ名が必須

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      create_drugs
      create_supplements
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def create_drugs
    return if drug_name.nil?
    drug_name.split("、").map(&:strip).each do |name|
      Drug.create!(drug_name: name, user_id: user_id)
    end
  end

  def create_supplements
    return if supplement_name.nil?
    supplement_name.split("、").map(&:strip).each do |name|
      Supplement.create!(supplement_name: name, user_id: user_id)
    end
  end
end

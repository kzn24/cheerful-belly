class Record < ApplicationRecord
  belongs_to :user
  has_many :record_symptoms, dependent: :destroy
  has_many :symptoms, through: :record_symptoms
  has_many :record_drugs, dependent: :destroy
  has_many :drugs, through: :record_drugs
  has_many :record_supplements, dependent: :destroy
  has_many :supplements, through: :record_supplements

  validates :condition_rating, :belly_rating, :meal_rating, :poop_rating, inclusion: { in: 0..5 }
  validates :food, :meal_memo, :poop_memo, :belly_memo, :condition_memo, length: { maximum: 255 }
  validates :record_date, presence: true

  validate :unique_record_date, on: :create

  def unique_record_date
    existing_record = Record.where(record_date: record_date, user_id: user_id).first
    if existing_record
      errors.add(:record_date, "#{record_date.strftime('%Y年 %-m月 %-d日')}の記録はすでに登録されています。")
      @existing_record_id = existing_record.id # 詳細画面に飛ぶためのIDを保持
    end
  end

  def existing_record_id
    @existing_record_id
  end
end

class Schedule < ApplicationRecord
  belongs_to :drug
  belongs_to :supplement

  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date } # end_dateがstart_dateより後の日付であることを検証
  validates :drug_id, presence: true, unless: -> { supplement_id.present? } # サプリが指定されている場合は薬のIDが必須ではない
  validates :supplement_id, presence: true, unless: -> { drug_id.present? } # 薬が指定されている場合はサプリのIDが必須ではない

  validate :start_date_cannot_be_in_past

  private

  def start_date_cannot_be_in_past
    if start_date.present? && start_date < Date.current
      errors.add(:start_date, "は今日以降の日付を選択してください。")
    end
  end
end

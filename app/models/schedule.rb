class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :drug, optional: true # FKはデフォでNot nullになってしまうからnullを許す
  belongs_to :supplement, optional: true # FKはデフォでNot nullになってしまうからnullを許す

  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date } # end_dateがstart_dateより後の日付であることを検証

  validate :start_date_cannot_be_in_past
  validate :one_of_drug_or_supplement

  def start_date_ja
    start_date.strftime("%Y年 %-m月 %-d日（#{japanese_weekday(start_date) }）")
  end

  def end_date_ja
    end_date.strftime("%Y年 %-m月 %-d日（#{japanese_weekday(end_date) }）")
  end

  private

  def start_date_cannot_be_in_past
    if start_date.present? && start_date < Date.current
      errors.add(:start_date, "は今日以降の日付を選択してください。")
    end
  end

  def one_of_drug_or_supplement
    if drug_id.blank? && supplement_id.blank?
      errors.add(:base, "薬またはサプリのいずれかを選択してください")
    elsif drug_id.present? && supplement_id.present?
      errors.add(:base, "薬とサプリの両方を同時に選択することはできません")
    end
  end

  def japanese_weekday(date)
    %w[日 月 火 水 木 金 土][date.wday]
  end
end

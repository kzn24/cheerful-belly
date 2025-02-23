class Drug < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :record_drugs, dependent: :destroy
  has_many :records, through: :record_drugs

  validates :drug_name, presence: true
  validates :drug_name, uniqueness: { scope: :user_id }
end

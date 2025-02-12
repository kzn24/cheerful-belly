class Drug < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy

  validates :drug_name, presence: true
  validates :drug_name, uniqueness: { scope: :user_id }
end

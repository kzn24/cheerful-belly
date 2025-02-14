class Supplement < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy

  validates :supplement_name, presence: true
  validates :supplement_name, uniqueness: { scope: :user_id }
end

class Supplement < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :record_supplements, dependent: :destroy
  has_many :records, through: :record_supplements

  validates :supplement_name, presence: true
  validates :supplement_name, uniqueness: { scope: :user_id }
end

class Supplement < ApplicationRecord
  belongs_to :user

  validates :supplement_name, presence: true
  validates :supplement_name, uniqueness: { scope: :user_id }
end

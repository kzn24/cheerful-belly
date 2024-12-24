class Drug < ApplicationRecord
  belongs_to :user

  validates :drug_name, presence: true
  validates :drug_name, uniqueness: { scope: :user_id }
end

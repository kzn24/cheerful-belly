class Drug < ApplicationRecord
  belongs_to :user

  validates :drug_name, presence: true
end

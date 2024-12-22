class Symptom < ApplicationRecord
  belongs_to :user

  validates :symptom_name, presence: true
end

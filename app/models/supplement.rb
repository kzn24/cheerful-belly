class Supplement < ApplicationRecord
  belongs_to :user

  validates :supplement_name, presence: true
end

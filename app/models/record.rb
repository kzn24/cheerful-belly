class Record < ApplicationRecord
  belongs_to :user

  validates :condition_rating, :belly_rating, :meal_rating, :poop_rating, inclusion: { in: 0..5 }
end

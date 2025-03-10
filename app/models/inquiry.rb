class Inquiry < ApplicationRecord
  validates :customer_name, presence: true
  validates :customer_email, presence: true
  validates :inquiry_message, presence: true
end

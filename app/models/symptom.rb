class Symptom < ApplicationRecord
  belongs_to :user

  validates :symptom_name, presence: true
  validates :symptom_name, uniqueness: { scope: :user_id }

  def self.symptom_save(user, symptom_names)
    return if symptom_names.nil?
    symptoms = symptom_names.split("、").map(&:strip)
    symptoms.each do |name|
      user.symptoms.create(symptom_name: name)
    end
  end
end

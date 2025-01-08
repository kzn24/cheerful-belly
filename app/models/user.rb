class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :drugs, dependent: :destroy
  has_many :supplements, dependent: :destroy
  has_many :symptoms, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :records, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[ｦ-ﾟ]+\z/, message: "は半角ｶﾀｶﾅで入力してください" }
  validates :last_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[ｦ-ﾟ]+\z/, message: "は半角ｶﾀｶﾅで入力してください" }
  validates :gender, presence: true
end

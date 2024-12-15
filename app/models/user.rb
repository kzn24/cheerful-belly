class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[ｦ-ﾟ]+\z/, message: "は半角カタカナのみで入力してください" }
  validates :last_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A[ｦ-ﾟ]+\z/, message: "は半角カタカナのみで入力してください" }
  validates :gender, presence: true
end

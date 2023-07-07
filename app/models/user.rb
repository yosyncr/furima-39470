class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
         validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }
         validates :password_confirmation, presence: true
         validates :last_name,:first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
         validates :last_name_kana,:first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthdate, presence: true
end

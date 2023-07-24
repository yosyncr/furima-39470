class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :password,  format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/,message: "は6文字以上半角英数字混合での入力てください" }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "を日本語文字で書いてください" }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "を日本語文字で書いてください" }
         validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: "をカナ文字で書いてください" }
         validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: "をカナ文字で書いてください"}
         validates :birth_date, presence: true

         has_many :items
         has_many :orders
end

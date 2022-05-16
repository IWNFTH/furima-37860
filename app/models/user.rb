class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :order

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i # 半角英数字混合のバリデーション
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/ # 全角カタカナ表記のバリデーション
  VALID_NAME = /\A[ぁ-んァ-ヶ一-龥々]+\z/ # 全角（漢字・ひらがな・カタカナ）のバリデーション

  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,         presence: true
  validates :first_name,       presence: true, format: { with: VALID_NAME }
  validates :first_name_kana,  presence: true, format: { with: VALID_NAME_KANA }
  validates :family_name,      presence: true, format: { with: VALID_NAME }
  validates :family_name_kana, presence: true, format: { with: VALID_NAME_KANA }
  validates :birthday,         presence: true
end

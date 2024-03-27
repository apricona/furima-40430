class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角漢字、かな、カナでご入力ください' }
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カナでご入力ください' }

  validates :nickname, :date_of_birth, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i }


  has_many :items
  has_many :orders
end


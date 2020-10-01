class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :birth_date, presence: true

  # ↓メールアドレス正規表現
  PASSWORD_FORMAT = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # ↓全角（漢字・ひらがな・カタカナ）正規表現
  NAME_FORMAT = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  # ↓全角（カタカナ）正規表現
  NAME_KANA_FORMAT = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :password, format: { with: PASSWORD_FORMAT }
    validates :first_name, format: { with: NAME_FORMAT }
    validates :last_name, format: { with: NAME_FORMAT }
    validates :first_name_kana, format: { with: NAME_KANA_FORMAT }
    validates :last_name_kana, format: { with: NAME_KANA_FORMAT }
  end

  has_many :items
  has_many :item_oders
end

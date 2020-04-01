class User < ApplicationRecord
  PASSWORD_REGEX = /\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z])(?=.*[[:^alnum:]])/x
  NAME_REGEX = /(\A\D{1,30}\Z)/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, format: { with: NAME_REGEX,
            message: 'format is invalid', allow_blank: true }
  validates :last_name, presence: true, format: { with: NAME_REGEX,
            message: 'format is invalid',allow_blank: true }
  validates :password,format: { with: PASSWORD_REGEX,
            message: 'is too weak', allow_blank: true }
  has_many :advertisements, dependent: :destroy
end

class User < ApplicationRecord
  NAME_REGEX = /(\A\D{1,30}\Z)/
  devise :secure_validatable,  email_validation: false

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :first_name, presence: true, format: { with: NAME_REGEX,
            message: 'format is invalid', allow_blank: true }
  validates :last_name, presence: true, format: { with: NAME_REGEX,
            message: 'format is invalid',allow_blank: true }
  validates :email,presence: true, 'valid_email_2/email': { disposable: true }
  has_many :advertisements, dependent: :destroy
end

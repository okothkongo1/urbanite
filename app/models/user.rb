class User < ApplicationRecord
  PASSWORD_REGEX = /\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z])(?=.*[[:^alnum:]])/x
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  NAME_REGEX = /(\A\D{1,30}\Z)/
  validates :first_name, presence: true, format: { with: NAME_REGEX,
            message: 'format is invalid', allow_blank: true }
  validates :last_name, presence: true, format: { with: NAME_REGEX,
            message: 'format is invalid',allow_blank: true }
  validates :email, presence: true, format: { with: EMAIL_REGEX,
            message: 'format is invalid', allow_blank: true },
            uniqueness:  { case_sensitive: false }
  validates :password, presence: true,format: { with: PASSWORD_REGEX,
            message: 'is too weak', allow_blank: true },
            confirmation: true
end

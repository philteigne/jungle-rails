class User < ApplicationRecord

  has_secure_password

  PASSWORD_REQUIREMENTS = /\A
  (?=.{8,}) # At least 8 characters long
  /x

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true, format: PASSWORD_REQUIREMENTS
  validates :password_confirmation, presence: true

end

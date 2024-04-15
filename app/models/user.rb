class User < ApplicationRecord

  has_secure_password

  PASSWORD_REQUIREMENTS = /\A
  (?=.{8,}) # At least 8 characters long
  /x

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct return true.
    if user && user.authenticate(password)
      user
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true, format: PASSWORD_REQUIREMENTS
  validates :password_confirmation, presence: true

end

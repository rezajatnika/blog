class User < ActiveRecord::Base
  has_secure_password

  # Email validations
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :email, uniqueness: { case_sensitive: false }

  # Password validation
  validates :password, length: { minimum: 6 }
end

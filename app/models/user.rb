class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  
end

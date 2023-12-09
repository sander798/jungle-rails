class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 7 }

end

class User < ApplicationRecord

  has_many :books

  validates :email, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 10 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :phone_number, :with => /\d[0-9]\)*\z/

  has_secure_password
end

class User < ActiveRecord::Base
  include BCrypt

  has_many :posts
  has_secure_password
  validates_presence_of :username, :email
  validates :email, uniqueness: true

end
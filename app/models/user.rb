class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
end

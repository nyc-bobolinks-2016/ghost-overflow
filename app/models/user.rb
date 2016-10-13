class User < ActiveRecord::Base
  has_secure_password
  validates :full_name, :password, :email, presence: true
  validates :email, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

end

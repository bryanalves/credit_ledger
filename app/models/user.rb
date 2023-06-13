class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, inclusion: {in: %w(user admin)}
  attr_accessor :password

  has_many :credit_items

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end

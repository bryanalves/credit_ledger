class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, inclusion: {in: %w(user admin)}

  def admin?
    role == 'admin'
  end
end

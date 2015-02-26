class Customer < ActiveRecord::Base
  before_create :set_view_token

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /@/, message: "is not a valid email" }
  validates :customer_id, presence: true

  has_many :credit_items

  def name
    "#{first_name} #{last_name}"
  end

  def balance
    credit_items.sum(:value)
  end

  private

  def set_view_token
    self.view_token ||= SecureRandom.hex
  end
end

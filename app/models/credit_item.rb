class CreditItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :category

  validates :category_id, presence: true
  validates :value, presence: true

  def category_name
    category.try!(:name) || 'Deleted Category'
  end

  def self.balance
    sum(:value)
  end
end

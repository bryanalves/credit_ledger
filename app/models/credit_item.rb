class CreditItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :category

  validates :category_id, presence: true
  validates :value, presence: true
end

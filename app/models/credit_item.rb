class CreditItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_one :category
end

class Category < ActiveRecord::Base
  has_many :credit_items
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :credit_item do
    user
    customer
    category
    value { 2.0 }
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    sequence(:email) {|n| "user_#{n}@example.com"}
    sequence(:first_name) {|n| "first#{n}"}
    sequence(:last_name) {|n| "last_#{n}"}
    sequence(:customer_id) {|n| "id_#{n}"}
  end
end

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user_#{n}@example.com" }
    password_digest { "blah" }

    factory :admin_user do
      role { 'admin' }
    end
  end
end

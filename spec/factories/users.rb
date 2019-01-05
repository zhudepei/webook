FactoryBot.define do
  factory :user do
    name { 'Tom' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'test_password' }
  end
end

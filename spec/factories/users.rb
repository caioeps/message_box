FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@email.com" }
    password              '123123'
    password_confirmation '123123'
  end
end

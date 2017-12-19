FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@email.com" }
    password              '123123'
    password_confirmation '123123'

    trait :with_authentication_token do
      authentication_token '4uth3nt1c4t10n_t0k3n'
    end
  end
end

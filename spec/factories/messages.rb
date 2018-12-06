FactoryBot.define do
  factory :message do
    subject     'Subject'
    body        'Lorem ipsum dolor amet.'
    read_at     nil
    archived_at nil
    status :processed

    association :receiver, factory: :user
    association :sender,   factory: :user

    trait :archived do
      archived_at { Time.zone.now }
    end

    trait :read do
      read_at { Time.zone.now }
    end

    trait :with_large_body do
      body 'a' * 300
    end

    trait :pending do
      status :pending
    end
  end
end

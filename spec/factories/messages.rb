FactoryBot.define do
  factory :message do
    subject     'Subject'
    body        'Lorem ipsum dolor amet.'
    read_at     "2017-12-15 03:20:37"
    archived_at "2017-12-15 03:20:37"

    association :receiver, factory: :user
    association :sender,   factory: :user
  end
end

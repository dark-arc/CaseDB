FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'ReallyBadPassword'
    password_confirmation 'ReallyBadPassword'

    trait :admin do
      after(:build) do |a|
        a.roles << [:admin]
      end
    end
    trait :moderator do
      after(:build) do |a|
        a.roles << [:moderator]
      end
    end
    trait :researcher do
      after(:build) do |a|
        a.roles << [:researcher]
      end
    end
    trait :user do
      after(:build) do |a|
        a.roles << [:user]
      end
    end
  end
end

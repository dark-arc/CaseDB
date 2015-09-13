FactoryGirl.define do
  factory :alias do
    name {Faker::Name.name}
    default false
    trait :default do
      default true
    end
  end
end

FactoryGirl.define do
  factory :anatomy do
    name { Faker::Internet.slug }
  end
end

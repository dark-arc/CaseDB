FactoryGirl.define do
  factory :mark_type do
    name { Faker::Internet.slug }
  end
end

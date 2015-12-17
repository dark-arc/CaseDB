FactoryGirl.define do
  factory :mark do
    person { build(:person) }
    anatomy { build(:anatomy) }
    mark_type { build(:mark_type) }
    description { Faker::Lorem.paragraphs(1).join('\n\n') }
  end
end

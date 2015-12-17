FactoryGirl.define do
  factory :case_file do
    name { Faker::Lorem.words(rand(3..5)).join(' ') }
    brief { Faker::Lorem.paragraphs(rand(5..14)).join("\n\n") }
    trait :with_events do
      after :build do |c|
        c.events << create(:event)
        c.events << create(:event)
        c.events << create(:event)
        c.events << create(:event)
        c.events << create(:event)
      end
    end
  end
end

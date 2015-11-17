FactoryGirl.define do
  factory :person do
    after(:build) do |p|
      create(:alias,:default,person: p)
    end
    gender {Person.genders.keys.sample}
    height {Person.heights.keys.sample}
    build {Person.builds.keys.sample}
    eye_colour {Person.eye_colours.keys.sample}
    hair_colour {Person.hair_colours.keys.sample}
    hair_length {Person.hair_lengths.keys.sample}
    ic {Person.ics.keys.sample}
    beard {Person.beards.keys.sample}
    moustache {Person.moustaches.keys.sample}
    trait :with_birth do
      after(:build) do |p|
        p.birth << create(:event)
      end
    end
    trait :with_death do
      after(:build) do |p|
        p.death << create(:event)
      end
    end
  end
end

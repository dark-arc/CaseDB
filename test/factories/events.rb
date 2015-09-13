FactoryGirl.define do
  factory :event do 
    body {Faker::Lorem.paragraphs(rand(5..15)).join("\n\n")}
    date {Faker::Date.between(300.years.ago,2.days.ago)}
  end
end

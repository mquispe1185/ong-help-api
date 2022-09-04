FactoryBot.define do
  factory :ong do
    name        { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    phone       { Faker::Number.number(digits: 10) }
    email       { Faker::Internet.email }
    video_url   { Faker::Internet.url }
  end
end

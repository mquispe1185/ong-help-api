FactoryBot.define do
  factory :ong do
    name { Faker::Lorem.word }
    description { "My description" }
    street { "My street" }
    city
    province
    phone { 1 }
    email { "MyString" }
    facebook { "MyString" }
    instagram { "MyString" }
    twitter { "MyString" }
    longitude { "MyString" }
    latitude { "MyString" }
    user
    association :status_updated_by, factory: :user
    category
    status { 1 }
    tags { "MyString" }
    active { true }
  end
end

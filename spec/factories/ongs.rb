FactoryBot.define do
  factory :ong do
    name { "MyString" }
    description { "MyString" }
    street { "MyString" }
    city { nil }
    province { nil }
    phone { 1 }
    email { "MyString" }
    facebook { "MyString" }
    instagram { "MyString" }
    twitter { "MyString" }
    longitude { "MyString" }
    latitude { "MyString" }
    user { nil }
    category { nil }
    status { 1 }
    tags { "MyString" }
    active { false }
  end
end

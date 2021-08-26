FactoryBot.define do
  factory :campaign do
    name { "MyString" }
    description { "MyString" }
    city { nil }
    province { nil }
    phone { 1 }
    email { "MyString" }
    facebook { "MyString" }
    instagram { "MyString" }
    twitter { "MyString" }
    user { nil }
    category { nil }
    status { 1 }
    tags { "MyString" }
    active { false }
  end
end

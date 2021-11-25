FactoryBot.define do
  factory :event do
    ong { nil }
    date { "2021-08-20" }
    hour { "MyString" }
    title { "MyString" }
    description { "MyString" }
    city { nil }
    province { nil }
    status { 1 }
    created_by { nil }
  end
end

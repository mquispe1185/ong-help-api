FactoryBot.define do
  factory :contribution do
    item_donation { nil }
    user { nil }
    mount { "9.99" }
    status { 1 }
    code { "MyString" }
    status_updated_by { nil }
  end
end

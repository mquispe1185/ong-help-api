FactoryBot.define do
  factory :item_donation do
    title { "MyString" }
    description { "MyString" }
    mount { 1 }
    balance { 1 }
    raised { 1 }
    created_by { nil }
    month { 1 }
    year { 1 }
    status { 1 }
  end
end

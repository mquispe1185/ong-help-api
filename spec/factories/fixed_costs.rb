FactoryBot.define do
  factory :fixed_cost do
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

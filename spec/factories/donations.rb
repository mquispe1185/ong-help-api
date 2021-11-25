FactoryBot.define do
  factory :donation do
    fixed_cost { nil }
    user { nil }
    mount { 1 }
    status { 1 }
    way_to_pay { 1 }
    code { "MyString" }
    payment_id { 1 }
  end
end

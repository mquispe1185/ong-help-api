FactoryBot.define do
  factory :city do
    province { nil }
    name { "MyString" }
    active { false }
  end
end

FactoryBot.define do
  factory :city do
    name { Faker::Lorem.word }
    association :province
  end
end

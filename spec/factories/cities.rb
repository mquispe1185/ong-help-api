FactoryBot.define do
  factory :city do
    province
    name { "San Salvador" }
    active { true }
  end
end

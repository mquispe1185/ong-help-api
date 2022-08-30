FactoryBot.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Alphanumeric.alpha(number: 6) }
    name      { Faker::Name.first_name }
  end

  trait :admin do
    role { 'admin' }
  end

  trait :client do
    role { 'client' }
  end
end
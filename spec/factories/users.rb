FactoryBot.define do
  factory :user do
    provider  { 'email' }  
    uid       { Faker::IDNumber.valid }
    password  { Faker::Alphanumeric.alpha(number: 10) }
    name      { Faker::Name.name }
    image     { Faker::Avatar.image }
    email     { Faker::Internet.email }
    role      { 0 }
  end

  trait :admin do
    role { 'admin' }
  end

  trait :client do
    role { 'client' }
  end
end

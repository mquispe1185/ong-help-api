FactoryBot.define do
  factory :user do
    name      { Faker::Name.name }
    image     { Faker::Avatar.image }
    email     { Faker::Internet.email }
    password  { 'password' }
  end

  trait :admin do
    role { 'admin' }
  end

  trait :client do
    role { 'client' }
  end
end

FactoryBot.define do
  factory :user do
    name { Faker::Company.name }
    email { Faker::Internet.email }
  end
end

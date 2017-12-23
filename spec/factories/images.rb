FactoryBot.define do
  factory :image do
    name Faker::Internet.user_name
    url Faker::Internet.url
  end
end

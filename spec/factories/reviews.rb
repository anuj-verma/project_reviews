FactoryBot.define do
  factory :review do
    rating Faker::Number.between(1, 5)
    description Faker::Lorem.sentence
    project
    user
  end
end

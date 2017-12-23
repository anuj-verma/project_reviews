FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
    address { Faker::Address.street_address } 
    description Faker::Lorem.paragraph
    no_of_units Faker::Number.number(2)
    no_of_towers Faker::Number.between(1, 10)
    min_price Faker::Number.between(20, 30)
    max_price Faker::Number.between(60, 70)
    price_metric 'Lacs'
  end
end

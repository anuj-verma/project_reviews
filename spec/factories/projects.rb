# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :string
#  description  :text
#  no_of_units  :integer
#  no_of_towers :integer
#  status       :string
#  min_price    :integer
#  max_price    :integer
#  price_metric :string
#  amenities    :json             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  banner_url   :text
#

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
    banner_url Faker::Company.logo
  end
end

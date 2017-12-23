require 'faker'

# Creating Users
p "*** Creating Users Started ***"
10.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email)
end
p "*** Creating Users Completed ***"

# Creating Projects
p "*** Creating Projects Started ***"
100.times do
  Project.create!(
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}, #{Faker::Address.postcode}",
    description: Faker::Lorem.paragraph,
    no_of_units: Faker::Number.number(2),
    no_of_towers: Faker::Number.between(1, 10),
    min_price: Faker::Number.between(20, 30),
    max_price: Faker::Number.between(60, 70),
    price_metric: 'Lacs',
    amenities: {
      fridge: [true, false].sample,
      park: [true, false].sample,
      gymnasium: [true, false].sample,
      lift: [true, false].sample,
      security: [true, false].sample,
      swimming_pool: [true, false].sample,
    }
  )
end
p "*** Creating Projects Completed ***"

users = User.all

# Creating Project Reviews
p "*** Creating Reviews Started ***"
Project.all.each do |project|
  [5, 10].sample.times do
    project.reviews.create!(
      rating: Faker::Number.between(1, 5),
      description: Faker::Lorem.sentence,
      user: users.sample,
      project: project
    )
  end
end
p "*** Creating Reviews Completed ***"

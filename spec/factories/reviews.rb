# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  rating      :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  project_id  :integer
#

FactoryBot.define do
  factory :review do
    rating Faker::Number.between(1, 5)
    description Faker::Lorem.sentence
    project
    user
  end
end

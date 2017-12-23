# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  name           :string
#  url            :text
#  imageable_type :string
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :image do
    name Faker::Internet.user_name
    url Faker::Internet.url
    association :imageable, factory: :project
  end
end

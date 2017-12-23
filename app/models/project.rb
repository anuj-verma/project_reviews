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
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ApplicationRecord
  has_many :reviews
end

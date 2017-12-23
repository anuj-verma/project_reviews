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

require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

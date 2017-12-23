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
  let(:project) { FactoryBot.create(:project) }

  it 'is valid with valid attributes' do
    expect(project).to be_valid
  end

  it 'is invalid without name' do
    project.name = nil
    expect(project).to_not be_valid
  end

  it 'is invalid without address' do
    project.address = nil
    expect(project).to_not be_valid
  end

  it 'is invalid without description' do
    project.description = nil
    expect(project).to_not be_valid
  end

  it 'is invalid without banner_url' do
    project.banner_url= nil
    expect(project).to_not be_valid
  end

  it 'is invalid with no_of_units other than integer' do
    project.no_of_units = 23.5
    expect(project).to_not be_valid
  end

  it 'is invalid with no_of_towers other than integer' do
    project.no_of_towers = 23.5
    expect(project).to_not be_valid
  end

  it 'is invalid if min_price is greater than max_price' do
    project.min_price = 50
    project.max_price = 30
    expect(project).to_not be_valid
  end
end

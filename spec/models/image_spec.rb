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

require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { FactoryBot.create(:image) }

  it 'is valid with valid attributes' do
    expect(image).to be_valid
  end

  it 'is invalid without name' do
    image.name = nil
    expect(image).to_not be_valid
  end

  it 'is invalid without url' do
    image.url = nil
    expect(image).to_not be_valid
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is invalid without name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is invalid with invalid email format' do
    user.email = 'a.com'
    expect(user).to_not be_valid
  end
end

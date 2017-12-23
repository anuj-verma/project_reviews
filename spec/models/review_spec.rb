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

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:project) { FactoryBot.create(:project) }
  let(:user) { FactoryBot.create(:user) }
  let(:review) { FactoryBot.create(:review, project: project, user: user) }

  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end

  it 'is invalid without rating' do
    review.rating = nil
    expect(review).to_not be_valid
  end

  it 'is invalid without description' do
    review.description = nil
    expect(review).to_not be_valid
  end
end


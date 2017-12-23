require 'rails_helper'

resource "2. Reviews" do
  before(:each) do
    header 'Accept', "application/#{APP_NAME}; version=web_v1"
    header 'Content-Type', 'application/json'
  end

  post '/projects/:project_id/reviews' do
    parameter 'project_id', 'ID of Project for which Review will be created', required: true
    parameter 'user_id', 'ID of User creating the Review', scope: :review, required: true
    parameter 'rating', 'Review rating given by User', scope: :review, required: true
    parameter 'description', 'Review comment given by User', scope: :review, required: true

    let!(:project) { FactoryBot.create(:project) }
    let(:user)  { FactoryBot.create(:user) }
    let!(:project_id) { project.id }

    let(:created_review) { project.reviews.first }

    let(:valid_params) {
      {
        review: {
          user_id: user.id,
          description: 'Good Project',
          rating: 4
        }
      }
    }

    let(:valid_response) {
      {
        data: {
          review: {
            id: created_review.id,
            rating: created_review.rating,
            description: created_review.description,
            user: {
              id: user.id,
              name: user.name,
              email: user.email
            }
          }
        }
      }.with_indifferent_access
    }

    example 'R01. Creating Review for a Project', document: :web_v1 do
      do_request(valid_params)

      response = JSON.parse(response_body)
      expect(status).to eq(200)
      expect(response).to eq(valid_response)
    end
  end
end

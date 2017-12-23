require 'rails_helper'

resource "1. Projects" do
  before(:each) do
    header 'Accept', "application/#{APP_NAME}; version=web_v1"
    header 'Content-Type', 'application/json'
  end

  get '/projects' do
    let!(:projects) { FactoryBot.create_list(:project, 5) }

    example 'P01. Listing Projects', document: :web_v1 do
      do_request

      response = JSON.parse(response_body)
      expect(status).to eq(200)
      expect(response['data']['projects'].size).to eq(5)
    end
  end

  get '/projects/:id' do
    parameter 'id', 'ID of Project', required: true

    let(:project) { FactoryBot.create(:project) }
    let(:user) { FactoryBot.create(:user) }
    let(:id) { project.id }
    let!(:reviews) { FactoryBot.create_list(:review, 5, user: user, project: project) }

    example 'P02. Project Show', document: :web_v1 do
      do_request

      response = JSON.parse(response_body)
      expect(status).to eq(200)
    end
  end
end

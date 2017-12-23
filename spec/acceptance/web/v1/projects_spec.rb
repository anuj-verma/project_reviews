require 'rails_helper'

resource "1. Projects" do
  before(:each) do
    header 'Accept', "application/#{APP_NAME}; version=web_v1"
  end

  get '/projects' do
    let!(:projects) { FactoryBot.create_list(:project, 5) }

    example 'Listing Projects', document: :web_v1 do
      do_request

      response = JSON.parse(response_body)
      expect(status).to eq(200)
      expect(response['data']['projects'].size).to eq(5)
    end
  end
end

require 'rails_helper'

resource '3. Sessions' do
  before(:each) do
    header 'Accept', "application/#{APP_NAME}; version=web_v1"
    header 'Content-Type', 'application/json'
  end

  post '/login' do
    parameter :email, 'Email entered by User', required: true, scope: :user
    parameter :password, 'Password entered by User', required: true, scope: :user

    let(:user) { FactoryBot.create(:user) }
    let(:api_key) { AuthHandler.encode(user) }

    let(:valid_params) {
      {
        user: {
          email: user.email,
          password: '12345678'
        }
      }
    }

    let(:invalid_params) {
      {
        user: {
          email: user.email,
          password: nil
        }
      }
    }

    let(:valid_response) {
      {
        data: {
          user: {
            id: user.id,
            name: user.name,
            email: user.email,
            api_key: api_key
          }
        }
      }.with_indifferent_access
    }

    let(:invalid_response) {
      {
        errors: {
          message: I18n.t('user.invalid')
        }
      }.with_indifferent_access
    }

    example 'S01. User SignIn with correct credentials', document: :web_v1 do
      do_request(valid_params)

      response = JSON.parse(response_body)
      expect(status).to eq(200)
      expect(response).to eq(valid_response)
    end

    example 'S02. User SignIn with incorrect credentials', document: :web_v1 do
      do_request(invalid_params)

      response = JSON.parse(response_body)
      expect(status).to eq(401)
      expect(response).to eq(invalid_response)
    end
  end

  post '/verify_token' do
    let(:user) { FactoryBot.create(:user) }
    let(:api_key) { AuthHandler.encode(user) }

    let(:valid_response) {
      {
        data: {
          user: {
            id: user.id,
            name: user.name,
            email: user.email,
            api_key: api_key
          }
        }
      }.with_indifferent_access
    }

    let(:invalid_response) {
      {
        errors: {
          message: I18n.t('api_key.invalid')
        }
      }.with_indifferent_access
    }

    example 'S03. Verify Token with correct api_key', document: :web_v1 do
      header 'X-Api-Key', api_key
      do_request

      response = JSON.parse(response_body)
      expect(status).to eq(200)
      expect(response).to eq(valid_response)
    end

    example 'S04. Verify Token with invalid api_key', document: :web_v1 do
      header 'X-Api-Key', 'invalid_api_key'
      do_request

      response = JSON.parse(response_body)
      expect(status).to eq(401)
      expect(response).to eq(invalid_response)
    end
  end
end

Rails.application.routes.draw do
  API_CLIENT_VERSIONS.keys.each do |client|
    API_CLIENT_VERSIONS[client].each do |version|
      mount Apitome::Engine => "/docs/#{ client }/#{ version }",
        as: "apitome-#{ client }-#{ version }",
        constraints: ApitomeVersion.new(client, version)
    end
  end
  api_version(
    module: 'Web::V1',
    header: {
      name: 'Accept',
      value: "application/#{APP_NAME}; version=web_v1"
    }
  ) do
    resources :projects, only: [:index, :show] do
      resources :reviews, only: [:create, :edit, :update]
    end

    post '/login', to: 'sessions#create'
    post '/verify_token', to: 'sessions#verify_token'
  end
end

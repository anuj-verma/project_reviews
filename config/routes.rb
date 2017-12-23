Rails.application.routes.draw do
  api_version(
    module: 'Web::V1',
    header: {
      name: 'Accept',
      value: 'application/vnd.project_reviews.com; version=web_v1'
    }
  ) do
    resources :projects, only: [:index, :create, :edit, :update] do
      resources :reviews, only: [:index, :create, :edit, :update]
    end
  end
end

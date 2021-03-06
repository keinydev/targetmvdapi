Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions',
    confirmations: 'api/v1/confirmations'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :reset_passwords, only: :index 
      resources :topics, only: :index 
      resources :targets, only: [:index, :create, :destroy]
      resources :conversations, only: :index do
        resources :messages, only: [:index, :create]
      end
    end
  end
end

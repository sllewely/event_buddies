Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :events, param: :id, only: [:index, :create] do
        resources :user_event_responses, only: [:create]
      end
    end
  end
end

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :create] do
        resources :user_event_responses, only: [:create]
      end

      resources :friendship_requests, only: [:index, :create] do
        member do
          post 'confirm'
          post 'reject'
        end
      end
    end
  end
end

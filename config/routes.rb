Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :create] do
        resources :user_event_responses, only: [:create]
      end
    end
  end
end

Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' },
    controllers: { sessions: 'sessions', registrations: 'registrations' }

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :create, :show, :update] do
        resources :user_event_responses, only: [:create]
      end

      resources :friendship_requests, only: [:index, :create] do
        member do
          post 'confirm', 'reject'
        end
      end

      resources :users, only: [:show]

      resources :friendships, only: [:index]
    end
  end
end

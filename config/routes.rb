Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :events, param: :uuid, only: [:index, :create, :set_status] do
        member do
          post 'set_status'
        end
      end
    end
  end
end

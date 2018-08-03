Rails.application.routes.draw do
  get 'home/index'

  namespace :api do
    resources :events do

    end
  end
end

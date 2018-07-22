Rails.application.routes.draw do
  get 'home/index'

  resources :events do

  end
end

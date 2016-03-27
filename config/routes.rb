Rails.application.routes.draw do
  resources :users
  resources :events
  resources :venues

  namespace 'api', defaults: { format: json } do
    resources :users
    resource :session, only: [:show, :create, :destroy]
  end

  root 'events#index'
end

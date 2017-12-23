Rails.application.routes.draw do
  
  resources :users
  resources :events
  resources :venues

  namespace 'api', defaults: { format: :json } do
    # match '/submit_expense/:id' => 'expenses#submit_expense', :as => 'submit_expense'
    get '/events' => 'events#index'
    # resources :users
    # resource :session, only: [:show, :create, :destroy]
  end

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/signin' => 'sessions#new'

  root to: 'home#home'
end

Rails.application.routes.draw do
  
  resources :users
  resources :events
  resources :venues

  # namespace 'api', defaults: { format: :json } do
  #   resources :users
  #   resource :session, only: [:show, :create, :destroy]
  # end

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/signin' => 'sessions#new'

  get 'home' => 'home#home'

  root to: 'static_pages#home'

end

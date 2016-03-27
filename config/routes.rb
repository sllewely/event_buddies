Rails.application.routes.draw do
  root to: "static_pages#home"
  
  resources :users
  resources :events
  resources :venues

  namespace 'api', defaults: { format: :json } do
    resources :users
    resource :session, only: [:show, :create, :destroy]
  end

end

Rails.application.routes.draw do
  resources :posts
  get '/dashboard', to: "posts#dashboard", as: :dashboard
  
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'welcome#index'
end

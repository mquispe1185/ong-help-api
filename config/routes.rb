Rails.application.routes.draw do
  resources :users, except: [:create]
  resources :campaigns
  resources :cities
  resources :provinces
  resources :categories
  resources :ongs
  # mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks: "overrides/omniauth_callbacks"
  }
end

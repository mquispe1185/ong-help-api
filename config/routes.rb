Rails.application.routes.draw do
  resources :ongs
  # mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks: "overrides/omniauth_callbacks"
  }
end

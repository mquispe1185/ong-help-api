Rails.application.routes.draw do
  resources :cities
  resources :provinces
  resources :ongs
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks: "overrides/omniauth_callbacks"
  }
end

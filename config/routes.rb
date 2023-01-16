Rails.application.routes.draw do
  resources :entity_links
  resources :contributions
  resources :donations
  resources :item_donations
  resources :fixed_costs
  resources :users, except: [:create]
  resources :campaigns do
    collection do
      get :user_campaigns
    end
    member do
      put :set_photos
      delete :delete_photo
    end
  end
  resources :cities
  resources :provinces
  resources :categories
  resources :ongs do
    collection do
      get :user_ongs
    end
    member do
      put :set_photos
      delete :delete_photo
    end
  end
  resources :search do
    collection do
      get :init_entities
    end
  end
  # mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks: "overrides/omniauth_callbacks"
  }
end

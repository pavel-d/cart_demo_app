Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:index]
  resources :cart_items do
    member do
      post :increase
      post :decrease
    end
  end
end

Rails.application.routes.draw do
  resource :cart, only: [ :show, :destroy ] do
    post :reset
  end
  resources :cart_items, only: [:update, :destroy]
  root to: "carts#show"
end

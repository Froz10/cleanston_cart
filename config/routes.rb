Rails.application.routes.draw do
  resource :cart, only: [ :show, :destroy ] do
    post :reset
  end
  root to: "carts#show"
end

Rails.application.routes.draw do
  mount ShoppingCart::Engine, at: '/'
  devise_for :users
  resources :products, only: %i[show index]
  root to: 'products#index'
end

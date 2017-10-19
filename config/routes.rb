ShoppingCart::Engine.routes.draw do
  resource :cart, only: %i[show update]
  resources :order_items, only: %i[create destroy] do
    put 'decrease', on: :member
    put 'increase', on: :member
  end
  resource :orders, only: %i[index show]
  resources :checkout_steps, only: %i[show update]
  match 'settings/address', to: 'settings#index', via: 'get'
  match 'settings/address', to: 'settings#create', via: 'post'
end

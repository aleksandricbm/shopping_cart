ShoppingCart::Engine.routes.draw do
  root 'cart#index'
  resource :cart, only: %i[show update]
  resources :order_items, only: %i[create destroy] do
    put 'decrease', on: :member
    put 'increase', on: :member
  end

  resource :orders, only: %i[index show]
end

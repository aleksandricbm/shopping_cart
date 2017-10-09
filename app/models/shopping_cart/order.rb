module ShoppingCart
  class Order < ApplicationRecord
    has_many :order_items
  end
end

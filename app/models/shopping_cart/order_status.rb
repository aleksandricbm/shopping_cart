module ShoppingCart
  class OrderStatus < ApplicationRecord
    has_many :orders

    validates :name, presence: true, length: { minimum: 2 }
  end
end

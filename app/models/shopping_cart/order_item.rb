module ShoppingCart
  class OrderItem < ApplicationRecord
    belongs_to :product, class_name: ShoppingCart.product_class.to_s
    belongs_to :order

    before_save :save_item

    def add_product(current_item)
      current_item.quantity += 1 if current_item.quantity?
    end

    def remove_product(current_item)
      current_item.quantity -= 1 if current_item.quantity > 1
    end

    def item_total_price
      self.price * self.quantity
    end

    def product_price
      product.price
    end

    def save_item
      self.price = product_price
    end
  end
end

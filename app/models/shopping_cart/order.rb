module ShoppingCart
  class Order < ApplicationRecord
    has_many :order_items
    has_many :products, class_name: ShoppingCart.product_class.to_s, through: :order_items
    belongs_to :coupon, optional: true
    belongs_to :shipping_method, optional: true
    belongs_to :order_status, optional: true
    belongs_to :user, class_name: ShoppingCart.user_class.to_s, optional: true
    has_one :credit_card
    has_one :billing_address
    has_one :shipping_address

    scope :processing, -> { joins(:order_status).where(order_statuses: { name: 'Waiting for processing' }) }
    scope :delivered, -> { joins(:order_status).where(order_statuses: { name: 'Delivered' }) }
    scope :canceled, -> { joins(:order_status).where(order_statuses: { name: 'Canceled' }) }

    def total_price
      self.order_items.inject(0) { |sum, item| sum + item.item_total_price }
    end

    def discount
      return self.coupon.price if self.coupon.present?
      0
    end

    def shipping
      return self.shipping_method.price if self.shipping_method.present?
      0
    end

    def order_total
      total_price - discount + shipping
    end

    def total_quantity
      self.order_items.sum(:quantity)
    end
  end
end

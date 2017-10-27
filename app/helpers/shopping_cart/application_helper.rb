module ShoppingCart
  module ApplicationHelper
    def shop_quantity
      "<span class='shop-quantity'>#{current_order.total_quantity}</span>".html_safe if current_order.order_items.count.positive?
    end

    def active_category(category)
      params[:id].to_i == category.to_i ? 'active' : ''
    end

    def card_number_inv(number)
      '** ** **' + number.to_s[-4, 4]
    end
  end
end

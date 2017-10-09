require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrderItemsController < ApplicationController
    before_action :find_item, only: %i[destroy decrease increase]

    def create
      binding.pry
      if current_order.order_items.find_by(product_id: item_params[:product_id])
        binding.pry
        @item = current_order.order_items.find_by(product_id: item_params[:product_id])
        increase
      else
        binding.pry
        @item = current_order.order_items.new(item_params)
        @item.price = Poduct.find(item_params[:product_id]).price
        current_order.save
        session[:order_id] = current_order.id
        respond_to do |format|
          format.html
          format.js { render layout: false, locals: { qty: current_order.total_quantity }, file: 'carts/_head_quantity_cart' }
        end
      end
    end

    def destroy
      @item.destroy
      current_order.save
      redirect_cart
    end

    def decrease
      @item.remove_product(@item)
      @item.save
      redirect_cart
    end

    def increase
      @item.add_product(@item)
      @item.save
      respond_to do |format|
        format.html { redirect_to cart_path }
        format.js { render layout: false, locals: { qty: current_order.total_quantity }, file: 'carts/_head_quantity_cart' }
      end
    end

    private

    def find_item
      binding.pry
      @item = current_order.order_items.find(params[:id])
    end

    def redirect_cart
      redirect_to cart_path
    end

    def item_params
      params.require(:order_item).permit(:quantity, :product_id)
    end
  end
end

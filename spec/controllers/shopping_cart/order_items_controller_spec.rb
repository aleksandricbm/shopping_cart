require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItemsController, type: :controller do |variable|
    routes { ShoppingCart::Engine.routes }
    before {
      user = FactoryGirl.create(:user, :with_order)
      @order = user.orders.first
      session[:order_id] = @order.id
    }

    context "create" do
      it "return increase quantity product" do
        post :create, params: { order_item: { quantity: 1, product_id: @order.order_items.first.product_id } }
        expect(assigns(:item).quantity).to  eq 2
      end

      it "return order_item new" do
        product = FactoryGirl.create(:product)
        post :create, params: { order_item: { quantity: 1, product_id: product.id } }
        expect(assigns(:item).quantity).to  eq 1
      end
    end

    context "destroy" do
      it "destroy item" do
        qt = @order.total_quantity
        delete :destroy,  params: { id: @order.order_items.first.id }
        expect(assigns(:current_order).total_quantity).to eq (qt-1)
        expect(response).to redirect_to cart_path
      end
    end

    it "find_item" do
      controller.params = ActionController::Parameters.new({ id: @order.order_items.first.id})
      controller.instance_eval{current_order}
      expect(controller.instance_eval{find_item}).not_to be_nil
    end

    it "find_order" do
      expect(controller.instance_eval{current_order}).not_to be_nil
    end
  end
end

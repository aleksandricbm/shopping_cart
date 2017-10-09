module ShoppingCart
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # include ShoppingCart::Concerns::Current_order
    # include Current_order

    def current_order
      binding.pry
      @current_order ||= if session[:order_id]
        if Order.find(session[:order_id]).empty?
          Order.new
        else
          Order.find(session[:order_id])
        end
      elsif !current_user.nil? && current_user.orders.find_by(order_status_id: nil).present?
        current_user.orders.find_by(order_status_id: nil)
      else
        Order.new
      end
      rescue ActiveRecord::RecordNotFound
        reset_session
        redirect_to root_path
    end

  end
end

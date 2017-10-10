module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart
    require 'draper'

    initializer 'include module' do
      ActiveSupport.on_load :action_controller do
        include ShoppingCart::Current_order
      end
    end
  end
end

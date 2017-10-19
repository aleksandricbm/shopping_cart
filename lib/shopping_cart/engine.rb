module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart
    require 'jquery-rails'
    require 'country_select'
    require 'jquery_mask_rails'
    require 'wicked'
    require 'virtus'
    require 'draper'
    require 'devise'
    require 'haml-rails'
    require 'active_support'

    config.generators do |conf|
      conf.template_engine :haml
      conf.test_framework      :rspec,        fixture: false
      conf.fixture_replacement :factory_girl, dir: 'spec/factories'
      conf.assets false
      conf.helper false
    end

    # initializer 'include module' do
    #   ActiveSupport.on_load :action_controller do
    #     include ShoppingCart::Current_order
    #   end
    # end

    initializer :inject_helpers do
      ActiveSupport.on_load :action_controller do
        ::ApplicationController.send(:helper, ShoppingCart::Engine.helpers)
        ::ApplicationController.send(:include, ShoppingCart::Current_order)
      end
    end

  end
end

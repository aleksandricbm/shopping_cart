FactoryGirl.define do
  factory :order_status, class: 'ShoppingCart::OrderStatus' do
    id 1
    name 'Waiting for processing'
  end
end

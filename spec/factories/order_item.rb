FactoryGirl.define do
  factory :order_item, class: 'ShoppingCart::OrderItem' do
    association :product
    association :order_id, factory: :order
    quantity 1
    price 10
  end
end

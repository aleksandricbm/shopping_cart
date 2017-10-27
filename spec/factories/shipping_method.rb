FactoryGirl.define do
  factory :shipping_method, class: 'ShoppingCart::ShippingMethod' do
    name 'TEST'
    duration '2 to 4 days'
    price 10
  end
end

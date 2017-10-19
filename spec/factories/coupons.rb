FactoryGirl.define do
  factory :coupon, class: 'ShoppingCart::Coupon' do
    code 10
    price 10.00
  end
end

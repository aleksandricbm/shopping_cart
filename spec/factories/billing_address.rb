require 'ffaker'

FactoryGirl.define do
  factory :billing_address, class: 'ShoppingCart::BillingAddress' do
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    address FFaker::Address.street_address
    city FFaker::Address.country
    zip 49000
    phone 5678945678
  end
end

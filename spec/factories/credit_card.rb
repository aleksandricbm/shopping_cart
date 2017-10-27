FactoryGirl.define do
  factory :credit_card, class: 'ShoppingCart::CreditCard' do
    association :order
    number '14785236985236'
    name 'Diana'
    expired '11/22'
    cvv '456'
  end
end

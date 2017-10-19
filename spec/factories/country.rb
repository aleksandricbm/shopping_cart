FactoryGirl.define do
  factory :country, class: 'ShoppingCart::Country' do
    name FFaker::Address.country
  end
end

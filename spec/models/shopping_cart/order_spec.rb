require 'rails_helper'

module ShoppingCart
  RSpec.describe Order, type: :model do

    let(:order) { FactoryGirl.create(:order) }

    before(:example) do
      order.order_items = [FactoryGirl.build(:order_item, price: 10.00, quantity: 2)]
    end

    it { is_expected.to have_many(:products).through(:order_items) }
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to belong_to :coupon }
    it { is_expected.to belong_to :shipping_method }
    it { is_expected.to belong_to :order_status }

    it 'order total_price' do
      expect(order.total_price).to eq 16
    end

    it 'order total with discount' do
      order.coupon = FactoryGirl.create(:coupon, price: 10.00)
      expect(order.order_total).to eq 16
    end

    it 'retrun discount' do
      order.coupon = FactoryGirl.create(:coupon, price: 25.00)
      expect(order.discount).to eq 25
    end

    it 'get quantity order_items' do
      expect(order.total_quantity).to eq 2
    end
   end
end

require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItem, type: :model do
    it { is_expected.to belong_to :product }
    it { is_expected.to belong_to :order }

    let(:order) { FactoryGirl.create(:order) }
    let(:product) { FactoryGirl.create(:product) }
    let(:order_item) { FactoryGirl.create(:order_item, quantity: 3, order_id: order.id) }

    it 'return total price' do
      expect(order_item.item_total_price).to eq 24
    end
    it 'add one book' do
      qty = order_item.quantity
      expect(order_item.add_product(order_item)).to eq (qty + 1)
    end
    it 'remove book' do
      qty = order_item.quantity
      expect(order_item.remove_product(order_item)).to eq (qty - 1)
    end
  end
end

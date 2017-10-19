require 'rails_helper'

module ShoppingCart
  RSpec.describe CreditCard, type: :model do
    it { is_expected.to belong_to :order }
  end
end

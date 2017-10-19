require 'rails_helper'
require "cancan/matchers"

module ShoppingCart
  RSpec.describe CheckoutStepsController, type: :controller do

    context "validations" do
      describe "step/address" do
        subject(:address) {FactoryGirl.create(:shipping_method)}
        it "should validate first name with a 2-35 letter string" do
          ["", "a", "I"].each do |word|
            address.name = word
            expect(address).to_not be_valid
          end
          address.name = "ab"
          expect(address).to be_valid
        end
      end

    end
  end
end

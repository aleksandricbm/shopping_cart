require 'rails_helper'

module ShoppingCart
  RSpec.feature 'CheckOut_address', type: :feature do
    let(:user) { FactoryGirl.create(:user, :with_order) }

    before(:each) do
      login_as(user, scope: :user, run_callbacks: false)
      visit shopping_cart.checkout_step_path(:address)
      FactoryGirl.create(:shipping_method)
      FactoryGirl.create(:country)
    end

    describe 'login user and clicks the Checkout button' do
      it 'login user' do
        expect(page.html).to have_content 'test@example.com'
      end

      it 'his order (not empty cart) valid address' do
        expect(page.html).to have_content 'Checkout'
        fill_in 'setting_address[billing_address][first_name]', with: 'firstname'
        fill_in 'setting_address[billing_address][last_name]', with: 'lastname'
        fill_in 'setting_address[billing_address][address]', with: 'address'
        fill_in 'setting_address[billing_address][city]', with: 'city'
        fill_in 'setting_address[billing_address][zip]', with: '5555'
        fill_in 'setting_address[billing_address][phone]', with: '76545575'
        fill_in 'setting_address[shipping_address][first_name]', with: 'firstname'
        fill_in 'setting_address[shipping_address][last_name]', with: 'lastname'
        fill_in 'setting_address[shipping_address][address]', with: 'address'
        fill_in 'setting_address[shipping_address][city]', with: 'city'
        fill_in 'setting_address[shipping_address][zip]', with: '6666'
        fill_in 'setting_address[shipping_address][phone]', with: '887765554'
        click_button I18n.t('button.save_continue')
        expect(current_url).to have_content shopping_cart.checkout_step_path(:delivery)
      end

      it 'his order (not empty cart) invalid address' do
        expect(page.html).to have_content 'Checkout'
        expect(current_url).to have_content shopping_cart.checkout_step_path(:address)

        fill_in 'setting_address[billing_address][first_name]', with: 'Test'
        fill_in 'setting_address[billing_address][last_name]', with: 'lastname'
        fill_in 'setting_address[billing_address][address]', with: 'address'
        fill_in 'setting_address[billing_address][city]', with: 'city'
        fill_in 'setting_address[billing_address][zip]', with: '5555'
        fill_in 'setting_address[billing_address][phone]', with: ''
        fill_in 'setting_address[shipping_address][first_name]', with: 'firstname'
        fill_in 'setting_address[shipping_address][last_name]', with: 'lastname'
        fill_in 'setting_address[shipping_address][address]', with: 'address'
        fill_in 'setting_address[shipping_address][city]', with: 'city'
        fill_in 'setting_address[shipping_address][zip]', with: '6666'
        fill_in 'setting_address[shipping_address][phone]', with: '887765554'
        click_button I18n.t('button.save_continue')
        expect(current_url).to have_content shopping_cart.checkout_step_path(:address)
      end
    end
  end
end

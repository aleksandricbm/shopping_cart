class CreateShoppingCartCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :code
      t.decimal :price, precision: 8, scale: 2
      t.references :order, foreign_key: { to_table: :shopping_cart_orders }
    end
  end
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :orders, class_name: 'ShoppingCart::Order'
end

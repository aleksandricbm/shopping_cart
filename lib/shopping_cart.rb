require "shopping_cart/engine"

module ShoppingCart
  mattr_accessor :user_class
  mattr_accessor :book_class

  def self.user_class
    @@user_class.constantize
  end

  def self.book_class
    @@book_class.constantize
  end
end

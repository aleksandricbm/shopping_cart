$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopping_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopping_cart"
  s.version     = ShoppingCart::VERSION
  s.authors     = ["Aleksandr"]
  s.email       = ["1234567890@gmail.com"]
  s.homepage    = "http://localhost"
  s.summary     = "Summary of ShoppingCart."
  s.description = "Description of ShoppingCart."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

s.add_dependency 'rails'
  s.add_dependency 'virtus'
  s.add_dependency 'wicked'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'country_select'
  s.add_dependency 'draper'
  s.add_dependency 'jquery_mask_rails'
  s.add_dependency 'haml-rails'
  s.add_dependency 'devise'
  s.add_dependency 'cancancan', '~> 2.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'shoulda-callback-matchers'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'transactional_capybara'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
end

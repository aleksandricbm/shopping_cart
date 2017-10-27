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

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'virtus', '~> 1.0'
  s.add_dependency 'wicked', '~> 1.3.2'
  s.add_dependency 'jquery-rails', '~> 4.3.1'
  s.add_dependency 'country_select', '~> 2.5.2'
  s.add_dependency 'draper', '~> 3.0.1'
  s.add_dependency 'jquery_mask_rails', '~> 0.1.0'
  s.add_dependency 'haml-rails', '~> 1.0.0'
  s.add_dependency 'devise', '~> 4.3.0'
  s.add_dependency 'cancancan', '~> 2.0'

  s.add_development_dependency 'sqlite3', '~> 1.3.13'
  s.add_development_dependency 'pry-byebug', '~> 3.4.3'
  s.add_development_dependency 'rubocop', '~> 0.49.1'
  s.add_development_dependency 'factory_girl_rails', '~> 4.8.0'
  s.add_development_dependency 'capybara', '~> 2.15.4'
  s.add_development_dependency 'capybara-webkit', '~> 1.1'
  s.add_development_dependency 'database_cleaner', '~> 1.6.1'
  s.add_development_dependency 'ffaker', '~> 2.6.0'
  s.add_development_dependency 'shoulda-callback-matchers', '~> 1.1.4'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1.2'
  s.add_development_dependency 'transactional_capybara', '~> 0.2.0'
  s.add_development_dependency 'rspec-rails', '~> 3.6.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.6'
end

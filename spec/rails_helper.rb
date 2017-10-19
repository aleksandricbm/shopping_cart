# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'
require 'capybara/rails'
require 'factory_girl'
require 'cancan/matchers'
require 'shoulda/matchers'
require 'shoulda-callback-matchers'
require 'pry-byebug'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.after :each do
    Warden.test_reset!
  end
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :controller
  # config.include DeviseRequestSpecHelpers, type: :feature

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
  FactoryGirl.find_definitions

  config.include Capybara::DSL
  Capybara.javascript_driver = :webkit
  Capybara.default_max_wait_time = 5 # will not change the default_max_wait in my_session

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

  config.after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.include Shoulda::Matchers::ActiveModel, type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model
end



# require 'spec_helper'
# ENV['RAILS_ENV'] ||= 'test'
# require File.expand_path('../dummy/config/environment', __FILE__)
# abort('The Rails environment is running in production mode!') if Rails.env.production?
# if ENV['RAILS_ENV'] == 'test'
#   require 'simplecov'
#   SimpleCov.start 'rails'
#   puts 'required simplecov'
# end
# require 'rspec/rails'
# require 'capybara/rails'
# require 'shoulda/matchers'
# require 'ffaker'
# require 'rails-controller-testing'
# require 'shoulda-callback-matchers'
# FactoryGirl.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
# FactoryGirl.find_definitions

# REQUIRED_DIRS = %w[
#   support
#   features/cartify/shared_examples
#   models/cartify/shared_examples
# ].freeze

# REQUIRED_DIRS.each do |path|
#   Dir[Rails.root.sub('dummy', "/#{path}/**/*.rb")].each { |f| require f }
# end

# ActiveRecord::Migration.maintain_test_schema!

# RSpec.configure do |config|
#   config.include TransactionalCapybara::AjaxHelpers
#   config.use_transactional_fixtures = true
#   config.infer_spec_type_from_file_location!
#   config.filter_rails_from_backtrace!
#   config.include Devise::Test::ControllerHelpers, type: :controller
#   # config.include DeviseRequestSpecHelpers, type: :feature
#   # config.include FormHelpers, type: :feature
#   # config.include Features::SessionHelpers, type: :feature
#   config.include Shoulda::Matchers::ActiveModel, type: :model
#   config.include Shoulda::Matchers::ActiveRecord, type: :model
#   config.include Shoulda::Callback::Matchers::ActiveModel
#   config.include FactoryGirl::Syntax::Methods
#   config.include Capybara::Webkit::RspecMatchers, type: :feature
#   # config.include InjectSession, type: :feature
# end

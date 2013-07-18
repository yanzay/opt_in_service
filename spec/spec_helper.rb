require './app'
require 'rspec'
require 'rack/test'
require 'factory_girl'
require 'database_cleaner'
require './spec/factories'

include Rack::Test::Methods

def app
  Application
end

ActiveRecord::Base.logger.level = 1

RSpec.configure do |config|
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.orm = :active_record
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

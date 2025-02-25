require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'

RSpec.configure do |config|
  DatabaseCleaner[:sequel].strategy = :deletion
  DatabaseCleaner[:sequel].db = Sequel.connect('postgres://postgres:postgres@localhost:5432/users_development')

  config.before(:each) do
    DatabaseCleaner[:sequel].clean
  end
end

Airborne.configure do |config|
  config.base_url = 'http://localhost:3000'
end

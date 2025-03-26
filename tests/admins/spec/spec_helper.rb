require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'
require 'securerandom'

DB = Sequel.connect('postgres://postgres:postgres@localhost:5432/users_development')

RSpec.configure do |config|
  DatabaseCleaner[:sequel].strategy = :deletion
  DatabaseCleaner[:sequel].db = DB

  config.before(:each) do
    DatabaseCleaner[:sequel].clean
  end
end

Airborne.configure do |config|
  config.base_url = 'http://localhost:5001'
end

class User < Sequel::Model(:users)
  def before_create
    self.uuid = SecureRandom.uuid
    self.created_at = Time.now
    self.updated_at = Time.now
  end
end

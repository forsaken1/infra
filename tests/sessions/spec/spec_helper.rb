require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'
require 'bcrypt'

DB = Sequel.connect('postgres://postgres:postgres@localhost:5432/sessions_development')

RSpec.configure do |config|
  DatabaseCleaner[:sequel].strategy = :deletion
  DatabaseCleaner[:sequel].db = DB

  config.before(:each) do
    DatabaseCleaner[:sequel].clean
  end
end

Airborne.configure do |config|
  config.base_url = 'http://localhost:4000'
end

module Model
  def before_create
    self.created_at = Time.now
    self.updated_at = Time.now
  end
end

class User < Sequel::Model(:users)
  include Model

  def before_create
    self.uuid = SecureRandom.uuid
  end
end

class Session < Sequel::Model(:sessions)
  include Model
end

require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'

USERS_DB = Sequel.connect('postgres://postgres:postgres@localhost:5432/users_development')
SESSIONS_DB = Sequel.connect('postgres://postgres:postgres@localhost:5432/sessions_development')

RSpec.configure do |config|
  DatabaseCleaner[:sequel, db: USERS_DB].strategy = :deletion
  DatabaseCleaner[:sequel, db: SESSIONS_DB].strategy = :deletion

  config.before(:each) do
    DatabaseCleaner[:sequel, db: USERS_DB].clean
    DatabaseCleaner[:sequel, db: SESSIONS_DB].clean
  end
end

module Users
  class User < Sequel::Model(USERS_DB[:users])
  end
end

module Sessions
  class User < Sequel::Model(SESSIONS_DB[:users])
  end

  class Session < Sequel::Model(SESSIONS_DB[:sessions])
  end
end

def users_url(path)
  "http://localhost/users/#{path}"
end

def sessions_url(path)
  "http://localhost/sessions/#{path}"
end

def admins_url(path)
  "http://localhost/admins/#{path}"
end

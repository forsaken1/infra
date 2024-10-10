require "./base"

module Producers
  class NewUser < Base
    def initialize(@user : User)
      super()
    end

    private def topic
      "users"
    end

    private def payload
      {
        email: @user.email,
        password_hash: @user.password_hash
      }
    end
  end
end

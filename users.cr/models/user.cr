require "jennifer"
require "crypto/bcrypt"

class User < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    email: String,
    password_hash: String,
    is_admin: Bool,
    created_at: Time,
    updated_at: Time
  )

  def password=(password : String)
    self.password_hash = Crypto::Bcrypt.new(password, "123").digest.to_s # add salt
  end
end

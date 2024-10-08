require "jennifer"
require "crypto/bcrypt"

class User < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    email: String,
    password: { type: String?, virtual: true },
    password_hash: String?,
    is_admin: { type: Bool, default: false },
    created_at: { type: Time, null: true },
    updated_at: { type: Time, null: true }
  )

  before_create :crypt_password

  def crypt_password
    salt = "1234567890123456789012345"
    self.password_hash = Crypto::Bcrypt.new(self.password.as(String), salt).to_s
  end
end

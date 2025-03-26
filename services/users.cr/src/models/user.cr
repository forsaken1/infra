require "jennifer"
require "crypto/bcrypt"
require "uuid"

class User < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary64,
    uuid: String?,
    email: String,
    password: { type: String?, virtual: true },
    password_hash: String?,
    is_admin: { type: Bool, default: false },
    created_at: { type: Time, null: true },
    updated_at: { type: Time, null: true }
  )

  before_create :crypt_password
  before_create :generate_uuid

  def crypt_password
    self.password_hash = Crypto::Bcrypt.new(self.password.as(String), ENV["BCRYPT_SALT"]).to_s
  end

  def generate_uuid
    self.uuid = UUID.random.to_s
  end
end

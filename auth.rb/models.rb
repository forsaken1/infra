require 'bcrypt'

class User
  def self.create(name, email, password, db_conn)
    password_digest = BCrypt::Password.create(password)
    begin
      db_conn.exec_params("INSERT INTO users (name, email, password_digest, created_at) VALUES ($1, $2, $3, NOW())", [name, email, password_digest])
      return true
    rescue PG::Error => e
      puts e.message
      return false
    end
  end

  def self.authenticate(email, password, db_conn)
    res = db_conn.exec_params("SELECT * FROM users WHERE email = $1 LIMIT 1", [email]).first
    return nil unless res && BCrypt::Password.new(res["password_digest"]) == password
    {id: res["id"], name: res["name"], email: res["email"]}
  end
end

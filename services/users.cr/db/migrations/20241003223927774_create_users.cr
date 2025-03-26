class CreateUsers < Jennifer::Migration::Base
  def up
    create_table :users do |t|
      t.string :uuid, { :null => false, :unique => true }
      t.string :email, { :null => false, :unique => true }
      t.string :password_hash, { :null => false }
      t.bool :is_admin, { :default => false }
      t.timestamps

      # t.add_index(:uuid, type: :uniq) # TODO: fix it
    end
  end

  def down
    drop_table :users
  end
end

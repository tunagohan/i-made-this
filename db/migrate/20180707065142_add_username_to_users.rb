class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :username, :string, null: false, default: ""

    add_index :users, :uid,      unique: true
    add_index :users, :provider, unique: true
  end
end

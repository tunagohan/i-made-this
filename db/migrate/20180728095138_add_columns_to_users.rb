class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid,        :string, null: false
    add_column :users, :provider,   :string, null: false
    add_column :users, :name,       :string
    add_column :users, :nickname,   :string
    add_column :users, :location,   :string
    add_column :users, :image,      :string
    add_column :users, :description :string

    add_index :users, :uid, unique: true
  end
end

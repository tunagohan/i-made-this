class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer   :category_id,     null: false, default: 0
      t.string    :category_name,   null: false, default: ""
      t.boolean   :delete_flag,     null: false, default: 0

      t.timestamps
    end
    add_index :categories, :category_id,    unique: true
    add_index :categories, :category_name,  unique: true
  end
end

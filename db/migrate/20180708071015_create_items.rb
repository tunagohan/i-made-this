class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :user,     index: true
      t.belongs_to :category, index: true

      t.string  :title,       null: false, default: ""
      t.string  :description
      t.string  :url
      t.string  :image
      t.integer :good_count
      t.boolean :delete_flag, null: false, default: 0

      t.timestamps
    end
  end
end

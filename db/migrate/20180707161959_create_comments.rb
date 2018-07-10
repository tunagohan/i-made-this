class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :item,        index: true

      t.string     :commnet,      null: false, default: ""
      t.boolean    :delete_flag,  null: false, default: 0

      t.timestamps
    end
  end
end

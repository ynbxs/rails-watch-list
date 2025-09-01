class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :lists, :name, unique: true
  end
end

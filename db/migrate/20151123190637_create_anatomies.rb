class CreateAnatomies < ActiveRecord::Migration
  def change
    create_table :anatomies do |t|
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :children_count

      t.timestamps
    end
    add_index :anatomies, :parent_id
    add_index :anatomies, :lft
    add_index :anatomies, :rgt
  end
end

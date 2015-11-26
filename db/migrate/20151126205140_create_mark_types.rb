class CreateMarkTypes < ActiveRecord::Migration
  def change
    create_table :mark_types do |t|
      t.string :type
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :children_count

      t.timestamps
    end
    add_index :mark_types, :type
    add_index :mark_types, :lft
    add_index :mark_types, :rgt
  end
end

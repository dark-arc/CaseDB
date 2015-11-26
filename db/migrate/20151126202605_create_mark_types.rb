class CreateMarkTypes < ActiveRecord::Migration
  def change
    create_table :mark_types do |t|
      t.string "type"
      t.integer "parent_id"
      t.integer  "lft"
      t.integer  "rgt"
      t.integer  "depth"
      t.integer  "children_count"
      t.index ["lft"], name: "index_mark_types_on_lft"
      t.index ["parent_id"], name: "index_mark_types_on_parent_id"
      t.index ["rgt"], name: "index_mark_types_on_rgt"

      t.timestamps
    end
  end
end

class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.references :person, index: true, foreign_key: true
      t.references :anatomy, index: true, foreign_key: true
      t.references :mark_type, index: true, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end

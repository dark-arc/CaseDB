class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.references :person
      t.references :anatomical_location
      t.references :mark_type
      t.text :description
      t.timestamps
    end
  end
end

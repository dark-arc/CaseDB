class CreateMarkPeople < ActiveRecord::Migration
  def change
    create_table :mark_people do |t|
      t.references :mark, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.integer :location#

      t.timestamps
    end
  end
end

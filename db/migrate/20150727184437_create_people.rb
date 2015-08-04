class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :gender
      t.integer :height
      t.integer :weight
      t.integer :eye_colour
      t.integer :hair_colour
      t.integer :hair_length
      t.integer :ic

      t.timestamps
    end
  end
end

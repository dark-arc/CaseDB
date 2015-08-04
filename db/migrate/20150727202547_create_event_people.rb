class CreateEventPeople < ActiveRecord::Migration
  def change
    create_table :event_people do |t|
      t.references :person, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.integer :category

      t.timestamps
    end
  end
end

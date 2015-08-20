class DropEventPerson < ActiveRecord::Migration
  def change
    drop_table :event_person
  end
end

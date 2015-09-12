class RemoveNameFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :name
  end
end

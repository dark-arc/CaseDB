class AddLocationsToEvents < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.references :location
    end
  end
end

class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.references :person
      t.string :name

      t.timestamps
    end
  end
end

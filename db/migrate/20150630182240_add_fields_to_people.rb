class AddFieldsToPeople < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.column :gender, :integer, default: 0
      t.float :weight
      t.float :height
      t.column :eye, :integer, default: 0
      t.column :hair_colour, :integer, default: 0
      t.column :hair_length, :integer, default: 0
      t.column :moustache, :integer, default: 0
      t.column :beard, :integer, default: 0
      t.column :race, :integer, default: 0
      t.column :ic, :integer, default: 0
    end

    create_table :marks do |t|
      t.column :type, :integer, default: 0
      t.text :description
    end

    create_join_table :people, :marks do |t|
      t.column :location, :integer, default: 0
      t.text :description
    end
  end
end

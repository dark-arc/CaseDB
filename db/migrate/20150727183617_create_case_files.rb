class CreateCaseFiles < ActiveRecord::Migration
  def change
    create_table :case_files do |t|
      t.string :name
      t.string :brief

      t.timestamps
    end
  end
end

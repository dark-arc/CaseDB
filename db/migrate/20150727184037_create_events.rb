class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :case_file, index: true, foreign_key: true
      t.string :body
      t.string :tagline
      t.datetime :date

      t.timestamps
    end
  end
end

class AddTaglineToCase < ActiveRecord::Migration[5.0]
  def change
    change_table :case_files do |t|
      t.text :tagline
    end
  end
end

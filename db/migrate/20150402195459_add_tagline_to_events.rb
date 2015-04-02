class AddTaglineToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tagline, :string
		add_index :events, :tagline
  end
end

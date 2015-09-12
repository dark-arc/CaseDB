class AddDefaultToAliases < ActiveRecord::Migration
  def change
    add_column :aliases, :default, :boolean,:default => false
  end
end

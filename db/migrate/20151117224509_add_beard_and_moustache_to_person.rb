class AddBeardAndMoustacheToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer "beard"
      t.integer "moustache"
    end
  end
end

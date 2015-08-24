class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_enc
      t.text :email
      t.integer :roles_mask

      t.timestamps
    end
  end
end

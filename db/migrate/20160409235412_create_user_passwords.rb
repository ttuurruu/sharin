class CreateUserPasswords < ActiveRecord::Migration
  def change
    create_table :user_passwords do |t|
      t.integer :user_id
      t.string :password

      t.timestamps null: false
    end
  end
end

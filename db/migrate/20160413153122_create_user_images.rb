class CreateUserImages < ActiveRecord::Migration
  def change
    create_table :user_images do |t|
      t.integer :user_id
      t.string :image
      t.integer :use
      t.string :memo
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

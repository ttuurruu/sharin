class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :code
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

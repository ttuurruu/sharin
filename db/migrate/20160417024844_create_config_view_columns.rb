class CreateConfigViewColumns < ActiveRecord::Migration
  def change
    create_table :config_view_columns do |t|
      t.integer :config_view_id
      t.integer :config_column_id
      t.string :column_name
      t.boolean :visible,         default: true
      t.integer :view_order,         default: 0

      t.timestamps null: false
    end
  end
end

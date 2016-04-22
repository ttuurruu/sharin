class CreateConfigColumns < ActiveRecord::Migration
  def change
    create_table :config_columns do |t|
      t.string :column_name
      t.string :default_name_ja
      t.string :default_name_en
      t.string :default_name_zh
      t.string :custom_name_ja
      t.string :custom_name_en
      t.string :custom_name_zh
      t.integer :sys_lower
      t.integer :sys_high

      t.timestamps null: false
    end
  end
end

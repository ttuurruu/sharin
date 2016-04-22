class CreateConfigFormColumns < ActiveRecord::Migration
  def change
    create_table :config_form_columns do |t|
      t.integer :config_view_id
      t.integer :config_column_id
      t.string :attribute_type
      t.boolean :standard,         default: true
      t.boolean :visible,         default: true
      t.integer :view_order
      t.string :description_ja
      t.string :description_en
      t.string :description_zh
      t.boolean :required,         default: false
      t.integer :default
      t.integer :custom_lower
      t.integer :custom_high
      t.string :grid_class_label
      t.string :grid_class_value
      t.string :data_source

      t.timestamps null: false
    end
  end
end

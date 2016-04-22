class CreateTableSettings < ActiveRecord::Migration
  def change
    create_table :table_settings do |t|
      t.string :form_name
      t.integer :form_type
      t.string :table_name
      t.string :column_name
      t.string :attribute_type
      t.boolean :standard,         default: true
      t.boolean :use,         default: true
      t.integer :order_input
      t.integer :order_list
      t.integer :order_result
      t.string :custom_name_ja
      t.string :custom_name_en
      t.string :description_ja
      t.string :description_en
      t.boolean :required,         default: false
      t.string :default
      t.string :sys_lower
      t.string :sys_high
      t.string :custom_lower
      t.string :custom_high
      t.string :grid_class_label
      t.string :grid_class_value
      t.string :column_class
      t.string :locales_path
      t.string :font_awesome
      t.string :controller
      t.string :action

      t.timestamps null: false
    end
  end
end

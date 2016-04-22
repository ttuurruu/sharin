class CreateConfigFormFooters < ActiveRecord::Migration
  def change
    create_table :config_form_footers do |t|
      t.integer :config_view_id
      t.string :attribute_type
      t.string :grid_class
      t.string :column_class
      t.string :locales_path
      t.string :font_awesome
      t.string :controller
      t.string :action

      t.timestamps null: false
    end
  end
end

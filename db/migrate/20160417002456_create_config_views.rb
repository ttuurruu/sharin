class CreateConfigViews < ActiveRecord::Migration
  def change
    create_table :config_views do |t|
      t.string :controller
      t.string :action
      t.string :params
      t.string :title_ja
      t.string :title_en
      t.string :title_zh
      t.string :description_ja
      t.string :description_en
      t.string :description_zh
      t.boolean :views,         default: false
      t.boolean :form_column,         default: false
      t.boolean :form_footer,         default: false
      t.boolean :view_column,         default: false

      t.timestamps null: false
    end
  end
end

class CreateMemberTables < ActiveRecord::Migration
  def change
    create_table :member_tables do |t|
      t.string :name
      t.integer :category
      t.integer :hierarchy_level
      t.integer :data_type
      t.string :model
      t.string :controller
      t.string :font_awesome

      t.timestamps null: false
    end
  end
end

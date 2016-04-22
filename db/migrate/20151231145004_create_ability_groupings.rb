class CreateAbilityGroupings < ActiveRecord::Migration
  def change
    create_table :ability_groupings do |t|
      t.integer :category
      t.string :code
      t.string :name
      t.string :ability_requirements_id

      t.timestamps null: false
    end
  end
end

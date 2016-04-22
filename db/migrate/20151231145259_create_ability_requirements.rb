class CreateAbilityRequirements < ActiveRecord::Migration
  def change
    create_table :ability_requirements do |t|
      t.integer :category
      t.string :code
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end

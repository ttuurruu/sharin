class CreateEvaluationObjectives < ActiveRecord::Migration
  def change
    create_table :evaluation_objectives do |t|
      t.string :code
      t.string :title
      t.string :content
      t.boolean :enable, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

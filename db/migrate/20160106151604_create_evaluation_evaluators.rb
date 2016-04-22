class CreateEvaluationEvaluators < ActiveRecord::Migration
  def change
    create_table :evaluation_evaluators do |t|
      t.integer :evaluation_setting_id
      t.integer :path_level
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

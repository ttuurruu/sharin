class CreateEvaluationSettings < ActiveRecord::Migration
  def change
    create_table :evaluation_settings do |t|
      t.integer :evaluation_event_id
      t.integer :user_id
      t.integer :objective_id
      t.integer :ability_grouping_id
      t.integer :progress, default: 0
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

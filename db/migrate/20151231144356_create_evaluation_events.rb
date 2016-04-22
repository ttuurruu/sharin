class CreateEvaluationEvents < ActiveRecord::Migration
  def change
    create_table :evaluation_events do |t|
      t.date :started_on
      t.date :ended_on
      t.string :name
      t.integer :category
      t.integer :rate_max
      t.integer :rate_min
      t.boolean :two_phase
      t.boolean :objective
      t.boolean :feedback
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

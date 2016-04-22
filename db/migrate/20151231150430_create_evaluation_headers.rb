class CreateEvaluationHeaders < ActiveRecord::Migration
  def change
    create_table :evaluation_headers do |t|
      t.integer :evaluation_event_id
      t.integer :evaluation_setting_id
      t.integer :user_id
      t.decimal :mbo_rate_self
      t.decimal :mbo_rate_primary
      t.decimal :mbo_rate_secondary
      t.decimal :mbo_rate_fix
      t.string :mbo_coment_self
      t.string :mbo_coment_fix
      t.decimal :competency_rate_self
      t.decimal :competency_rate_primary
      t.decimal :competency_rate_secondary
      t.decimal :competency_rate_fix
      t.string :competency_coment_self
      t.string :competency_coment_fix
      t.decimal :total_rate_self
      t.decimal :total_rate_secondary
      t.decimal :total_rate_fix
      t.string :total_coment_self
      t.decimal :total_coment_primary
      t.decimal :total_coment_secondary

      t.timestamps null: false
    end
  end
end

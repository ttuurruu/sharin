class CreateEvaluationDetails < ActiveRecord::Migration
  def change
    create_table :evaluation_details do |t|
      t.integer :evaluation_header_id
      t.integer :user_id
      t.integer :category
      t.string :title
      t.string :content
      t.integer :weight
      t.decimal :result_rate_self
      t.string :result_content_self
      t.decimal :result_rate_primary
      t.string :result_content_primary
      t.decimal :result_rate_secondary
      t.string :result_content_secondary

      t.timestamps null: false
    end
  end
end

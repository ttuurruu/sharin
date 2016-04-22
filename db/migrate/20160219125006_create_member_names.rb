class CreateMemberNames < ActiveRecord::Migration
  def change
    create_table :member_names do |t|
      t.integer :user_id
      t.date :started_on
      t.date :ended_on
      t.string :name
      t.string :name_katakana
      t.string :name_romaji
      t.string :register
      t.string :register_katakana
      t.string :register_romaji
      t.string :memo
      t.integer :updated_status
      t.integer :updated_user
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

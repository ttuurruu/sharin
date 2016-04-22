class CreateMemberSystems < ActiveRecord::Migration
  def change
    create_table :member_systems do |t|
      t.integer :user_id
      t.date :started_on
      t.date :ended_on
      t.boolean :enable, default: true
      t.integer :member_role_id
      t.boolean :system_admin, default: false
      t.string :memo
      t.integer :updated_status
      t.integer :updated_user
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

class CreateMemberRoleDetails < ActiveRecord::Migration
  def change
    create_table :member_role_details do |t|
      t.integer :member_role_id
      t.integer :member_table_id
      t.integer :use_type
      t.integer :scope_type
      t.integer :level_type
      t.integer :time_type
      t.integer :crud_type
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

class CreateMemberRoles < ActiveRecord::Migration
  def change
    create_table :member_roles do |t|
      t.string   :name
      t.string   :description
      t.integer  :order
      t.boolean  :enable, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end

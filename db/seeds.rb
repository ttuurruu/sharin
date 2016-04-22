# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

table_names = ["config_columns","config_view_columns","config_views","config_form_columns","config_form_footers"]

table_names.each do |table_name|

  #CSV.foreach('db/member_communications.csv') do |row|
  #  MemberCommunication.create(:user_id => row[0])
  #end

  #CSV.foreach('db/member_names.csv') do |row|
  #  MemberName.create(:user_id => row[0], :started_on => row[1], :ended_on => row[2], :name => row[3])
  #end

  #CSV.foreach('db/member_systems.csv') do |row|
  #  MemberSystem.create(:user_id => row[0], :started_on => row[1], :ended_on => row[2], :enable => row[3], :member_role_id => row[4], :system_admin => row[5])
  #end

  if table_name == "member_tables"
    MemberTable.destroy_all
    CSV.foreach('db/member_tables.csv') do |row|
      MemberTable.create(
          :id => row[0],
          :name => row[1],
          :category => row[2],
          :hierarchy_level => row[3],
          :data_type => row[4],
          :model => row[5],
          :controller => row[6],
          :font_awesome => row[7]
      )
    end
  end

  if table_name == "config_columns"
    ConfigColumn.destroy_all
    CSV.foreach('db/config_columns.csv') do |row|
      ConfigColumn.create(
          :id => row[0],
          :column_name => row[1],
          :default_name_ja => row[2]
      )
    end
  end

  if table_name == "config_view_columns"
    ConfigViewColumn.destroy_all
    CSV.foreach('db/config_view_columns.csv') do |row|
      ConfigViewColumn.create(
          :config_view_id => row[0],
          :config_column_id => row[1],
          :column_name => row[2],
          :view_order => row[3]
      )
    end
  end

  if table_name == "config_views"
    ConfigView.destroy_all
    CSV.foreach('db/config_views.csv') do |row|
      ConfigView.create(
          :id => row[0],
          :controller => row[1],
          :action => row[2],
          :params => row[3],
          :title_ja => row[4],
          :description_ja => row[5],
          :views => row[6],
          :form_column => row[7],
          :form_footer => row[8],
          :view_column => row[9]
      )
    end
  end

  if table_name == "config_form_columns"
    ConfigFormColumn.destroy_all
    CSV.foreach('db/config_form_columns.csv') do |row|
      ConfigFormColumn.create(
          :config_view_id => row[0],
          :config_column_id => row[1],
          :attribute_type => row[2],
          :visible => row[3],
          :view_order => row[4],
          :description_ja => row[5],
          :required => row[6],
          :custom_lower => row[7],
          :custom_high => row[8],
          :grid_class_label => row[9],
          :grid_class_value => row[10],
          :data_source => row[11]
      )
    end
  end

  if table_name == "config_form_footers"
    ConfigFormFooter.destroy_all
    CSV.foreach('db/config_form_footers.csv') do |row|
      ConfigFormFooter.create(
          :config_view_id => row[0],
          :attribute_type => row[1],
          :grid_class => row[2],
          :column_class => row[3],
          :locales_path => row[4],
          :font_awesome => row[5],
          :controller => row[6],
          :action => row[7]
      )
    end
  end

=begin
CSV.foreach('db/table_settings.csv') do |row|
  TableSetting.create(
      :form_name => row[0],
      :form_type => row[1],
      :table_name => row[2],
      :column_name => row[3],
      :attribute_type => row[4],
      :use => row[5],
      :order_input => row[6],
      :order_list => row[7],
      :custom_name_ja => row[8],
      :description_ja => row[9],
      :required => row[10],
      :sys_lower => row[11],
      :sys_high => row[12],
      :custom_lower => row[13],
      :custom_high => row[14],
      :grid_class_label => row[15],
      :grid_class_value => row[16],
      :column_class => row[17],
      :locales_path => row[18],
      :font_awesome => row[19],
      :controller => row[20],
      :action => row[21]
  )
end
=end
end

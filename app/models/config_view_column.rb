class ConfigViewColumn < ActiveRecord::Base
  belongs_to :config_column
  belongs_to :config_view

  #入力フォーム項目
  scope :get_visible_column, ->(congig_view_id) { where(config_view_id: congig_view_id).where(visible: true).order("view_order") }


end

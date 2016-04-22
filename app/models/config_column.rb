class ConfigColumn < ActiveRecord::Base
  has_many :config_form_columns
  has_many :config_view_columns

end

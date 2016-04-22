class ConfigView < ActiveRecord::Base
  has_many :config_form_columns
  has_many :config_form_footers
  has_many :config_view_columns
end

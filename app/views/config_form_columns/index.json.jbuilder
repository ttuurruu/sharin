json.array!(@config_form_columns) do |config_form_column|
  json.extract! config_form_column, :id, :config_view_id, :column_name, :attribute_type, :standard, :visible, :order, :custom_name_ja, :custom_name_en, :custom_name_zh, :description_ja, :description_en, :description_zh, :required, :default, :sys_lower, :sys_high, :custom_lower, :custom_high, :grid_class_label, :grid_class_value, :data_source
  json.url config_form_column_url(config_form_column, format: :json)
end

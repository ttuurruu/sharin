json.array!(@config_columns) do |config_column|
  json.extract! config_column, :id, :column_name, :default_name_ja, :default_name_en, :default_name_zh, :custom_name_ja, :custom_name_en, :custom_name_zh
  json.url config_column_url(config_column, format: :json)
end

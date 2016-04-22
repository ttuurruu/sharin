json.array!(@config_view_columns) do |config_view_column|
  json.extract! config_view_column, :id, :config_view_id, :column_name, :visible, :view_order
  json.url config_view_column_url(config_view_column, format: :json)
end

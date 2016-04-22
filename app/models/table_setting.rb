class TableSetting < ActiveRecord::Base

  #参照画面項目
  scope :get_list_result, ->(form_name) { where(table_name: form_name).where(use: true).where.not(order_result: 0).order("order_result") }
  #参照画面項目
  scope :get_list, ->(form_name) { where(table_name: form_name).where(use: true).where.not(order_list: 0).order("order_list") }
  #入力フォーム項目
  scope :get_list_input, ->(form_name) { where(form_name: form_name).where(use: true).where.not(order_input: 0).order("order_input") }
  #フォーム初期表示等、参照元レコードの値取得
  scope :get_list_value, ->(form_name) { where(form_name: form_name).where(use: true).where(form_type: [1,2,3]) }

end

module Common extend ActiveSupport::Concern

  def set_view

    #呼び出されたコントローラ、アクションからview_idを取得
    config_view = ConfigView.where(controller: controller_name, action: action_name, params: params[:member_table_id]).first

    #view_idからview情報をセット
    @forms = config_view if config_view.views
    @form_columns = ConfigFormColumn.get_visible_column(config_view.id) if config_view.form_column
    @form_footers = ConfigFormFooter.where(config_view_id: config_view.id)  if config_view.form_footer
    @view_columns = ConfigViewColumn.where(config_view_id: config_view.id)  if config_view.view_column

  end

end
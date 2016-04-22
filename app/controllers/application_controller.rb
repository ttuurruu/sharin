class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :check_logined
  before_action :set_mailer_host

  # 多言語化　URLのlocaleパラメータから言語を取得する
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @locale = params[:locale]
  end
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  # モデルでユーザエージェント、セッションにアクセス可能に
  before_filter :set_request_filter
  def set_request_filter
    Thread.current[:request] = request
  end




  private

  ############不正ログインチェック#########################

  #ログインチェック
  def check_logined
    #セッション情報が存在するか
    if session[:user_id] then
      begin
        #セッションが存在する場合はusersテーブルからユーザ情報を取得
        @user = User.find(session[:user_id])

      rescue ActiveRecord::RecordNotFound
        #ユーザ情報がない場合にはセッションをリセット
        reset_session
      end
    end
    #ユーザ情報が取得できなかった場合にはログアウト画面に遷移
    unless @user
      redirect_to controller: :login , action: :logout
    end
  end

  ############メール関連#########################

  #メールに記載するサイトURLをセット(テスト・本番でURLがかわる為)
  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

end

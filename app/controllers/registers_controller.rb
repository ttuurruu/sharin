class RegistersController < ApplicationController
  layout 'login'
  skip_before_action :check_logined

  def index
    @register = Register.new
  end

  def auth
    #新規アカウント登録時のチェック

    @register = Register.new(params[:register])
    if @register.valid?

      #既にメールアドレスが登録されているかチェック
      usr = User.find_by(email: params[:register][:email] )
      unless usr
        #未登録の場合、メールを通知
        @email = params[:register][:email]
        @mail = NoticeMailer.sendmail_confirm(@email).deliver_now
        render :new_mail
      else
        #登録済みの場合エラー
        flash[:error] = '既に登録済みのメールアドレスです。'
        redirect_to registers_path
      end
    else
      flash[:error] = @register.errors.full_messages[0]
      redirect_to registers_path
    end
  end

  def password_reset
    @register = Register.new
    @table_settings = TableSetting.get_input_list('register')
  end

  def email_check
    #パスワードリセット時のチェック

    @register = Register.new(params[:register])
    if @register.valid?

      #既にメールアドレスが登録されているかチェック
      usr = User.find_by(email: params[:register][:email] )
      unless usr
        #未登録の場合エラー
        flash[:error] = '該当のメールアドレスは登録されていません。'
        redirect_to action: :password_reset
      else
        #登録済みの場合、メールを通知
        @email = params[:register][:email]
        @mail = NoticeMailer.sendmail_password_reset(@email).deliver_now
        render :reset_mail
      end

    else
      flash[:error] = @register.errors.full_messages[0]
      redirect_to action: :password_reset
    end
  end

end
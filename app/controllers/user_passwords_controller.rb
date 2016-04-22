class UserPasswordsController < ApplicationController
  include Common
  before_action :set_view, only: [:new]

  def new
    @record = UserPassword.new
  end

  def create
    @user_password = UserPassword.new
    @user_password.user_id = session[:user_id]
    @user_password.password = UserPassword.encrypt(params[:password])
    @user_password.save

    flash[:notice] = 'パスワード変更が完了しました。'
    redirect_to controller: 'homes', action: 'user'

  end

  private

    def user_password_params
      params.require(:user_password).permit(
          :password
      )
    end
end

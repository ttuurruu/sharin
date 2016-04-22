class HomesController < ApplicationController
  def user
    @user = User.find_by id: session[:user_id]
  end
end
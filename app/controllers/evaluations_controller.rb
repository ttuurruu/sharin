class EvaluationsController < ApplicationController
  def index

    @user = User.find_by id: session[:user_id]

    #���ȕ]��
    @evaluation_settings = EvaluationSetting.where(user_id: session[:user_id])

    #���ҕ]��(1���]��)
    #@evaluation_evaluators = EvaluationEvaluator.where(user_id: session[:user_id])
    @evaluation_settings2 = EvaluationSetting.joins(:evaluation_evaluators).where(evaluation_evaluators: { user_id: session[:user_id] , path_level:1 })
  end
end
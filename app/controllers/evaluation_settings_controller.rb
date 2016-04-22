class EvaluationSettingsController < ApplicationController
  before_action :set_evaluation_setting, only: [:edit, :update, :destroy]

  def index
    @q = EvaluationSetting.order(id: :asc).search(params[:q])
    @evaluation_settings = @q.result(distinct: true).page(params[:page])

    @evaluation_evaluators = EvaluationEvaluator.all

  end

  def new
    @evaluation_setting = EvaluationSetting.new
    @evaluation_setting.evaluation_evaluators.build([{path_level: 1}, {path_level: 2}, {path_level: 3}])

    @evaluation_events = EvaluationEvent.all
    @users = User.all
    @objectives = Objective.all
  end

  def edit
  end

  def create
    @evaluation_setting = EvaluationSetting.new(evaluation_setting_params)

    if @evaluation_setting.save
      flash[:notice] = '登録しました。'
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def update
    if @evaluation_setting.update(evaluation_setting_params)
      flash[:notice] = '更新しました。'
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @evaluation_setting.destroy
    redirect_to evaluation_settings_url, notice: 'Evaluation path was successfully destroyed.'
  end

  private
  def set_evaluation_setting
    @evaluation_setting = EvaluationSetting.find(params[:id])
  end

  def evaluation_setting_params
    params.require(:evaluation_setting).permit(
        :evaluation_event_id, :user_id, :objective_id, :ability_grouping_id,
        evaluation_evaluators_attributes: [:id,:evaluation_setting_id,:path_level,:user_id]
    )
  end
end

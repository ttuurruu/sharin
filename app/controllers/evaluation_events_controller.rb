class EvaluationEventsController < ApplicationController
  before_action :set_evaluation_event, only: [:edit, :update, :delete ,:show]

  def index

    @q = EvaluationEvent.order(started_on: :asc).search(params[:q])
    @evaluation_events = @q.result(distinct: true).page(params[:page])

  end

  def new
    @evaluation_event = EvaluationEvent.new
  end

  def edit
  end

  def create
    @evaluation_event = EvaluationEvent.new(evaluation_event_params)

    if @evaluation_event.save
      flash[:notice] = '登録しました。'
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def update
    if @evaluation_event.update(evaluation_event_params)
      flash[:notice] = '更新しました。'
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def show
    @evaluation_setting_count = EvaluationSetting.where(evaluation_event_id: params[:id]).group(:evaluation_event_id).count('evaluation_event_id')

    @q = EvaluationSetting.order(id: :asc).search(params[:q])
    @evaluation_settings = @q.result(distinct: true).page(params[:page])

    @evaluation_evaluators = EvaluationEvaluator.all

  end

  def delete
    @evaluation_event.deleted_at = Time.now
    @evaluation_event.save
    flash[:notice] = '削除しました。'
    redirect_to action: 'index'
  end

  private
  def set_evaluation_event
    @evaluation_event = EvaluationEvent.find(params[:id])
  end

  def evaluation_event_params
    params.require(:evaluation_event).permit(:started_on, :ended_on, :name, :category, :rate_max, :rate_min, :two_phase, :objective, :feedback, :result_entry, :enable)
  end
end

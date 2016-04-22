class EvaluationHeadersController < ApplicationController
  before_action :set_evaluation_header, only: [:edit, :update, :destroy]

  def entry
    @evaluation_header = EvaluationHeader.find_by(evaluation_event_id: params[:id], user_id:session[:user_id])
    unless @evaluation_header
      #既存レコードがない場合は新規作成
      @evaluation_header = EvaluationHeader.new
      @evaluation_header.evaluation_event_id = params[:id]
      @evaluation_header.evaluation_setting_id = params[:evaluation_setting]
      @evaluation_header.user_id = session[:user_id]
      @evaluation_header.save

    end
    #editへ
    redirect_to edit_evaluation_header_path(@evaluation_header.id)
  end

  def edit
    #form_head
    @evaluation_event = EvaluationEvent.find_by(id: @evaluation_header.evaluation_event_id)
    @evaluation_setting = EvaluationSetting.find_by(evaluation_event_id: @evaluation_header.evaluation_event_id, user_id:session[:user_id])
    @evaluation_evaluator1 = EvaluationEvaluator.find_by(evaluation_setting_id: @evaluation_setting.id, path_level: 1)
    @evaluation_evaluator2 = EvaluationEvaluator.find_by(evaluation_setting_id: @evaluation_setting.id, path_level: 2)

    #form_objective
    @evaluation_details = EvaluationDetail.where(evaluation_header_id: @evaluation_header.id)

  end

  def edit_evaluator
    @evaluation_header = EvaluationHeader.find_by(evaluation_setting_id: params[:id])

    #form_head
    @evaluation_event = EvaluationEvent.find_by(id: @evaluation_header.evaluation_event_id)
    @evaluation_setting = EvaluationSetting.find_by(evaluation_event_id: @evaluation_header.evaluation_event_id)
    @evaluation_evaluator1 = EvaluationEvaluator.find_by(evaluation_setting_id: @evaluation_setting.id, path_level: 1)
    @evaluation_evaluator2 = EvaluationEvaluator.find_by(evaluation_setting_id: @evaluation_setting.id, path_level: 2)

    #form_objective
    @evaluation_details = EvaluationDetail.where(evaluation_header_id: @evaluation_header.id)

  end

  def update

    @evaluation_setting = EvaluationSetting.find_by(id: params[:evaluation_header][:evaluation_setting_id])

    #header情報を更新
    @evaluation_header.update(evaluation_header_params)

    #ステータスを更新
    if @evaluation_setting.update(progress: @evaluation_setting.progress.to_i + 1)
      flash[:notice] = '更新しました。'
      redirect_to controller: 'evaluations' , action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @evaluation_header.destroy
    redirect_to evaluation_headers_url, notice: 'Evaluation header was successfully destroyed.'
  end

  private

  def set_evaluation_header
    @evaluation_header = EvaluationHeader.find(params[:id])
  end

  def evaluation_header_params
    params.require(:evaluation_header).permit(:evaluation_event_id, :evaluation_setting_id, :user_id, :progress, :mbo_rate_self, :mbo_rate_primary, :mbo_rate_secondary, :mbo_rate_fix, :mbo_coment_self, :mbo_coment_fix, :competency_rate_self, :competency_rate_primary, :competency_rate_secondary, :competency_rate_fix, :competency_coment_self, :competency_coment_fix, :total_rate_self, :total_rate_secondary, :total_rate_fix, :total_coment_self, :total_coment_primary, :total_coment_secondary)
  end
end

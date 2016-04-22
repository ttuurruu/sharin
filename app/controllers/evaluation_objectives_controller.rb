class EvaluationObjectivesController < ApplicationController
  before_action :set_evaluation_objective, only: [:show, :edit, :update]

  def index

    @q = EvaluationObjective.order(code: :asc).search(params[:q])
    @evaluation_objectives = @q.result(distinct: true).page(params[:page])
  end

  def new
    @evaluation_objective = EvaluationObjective.new
  end

  def edit
  end

  def create

    @evaluation_objective = EvaluationObjective.new(evaluation_objective_params)
    if @evaluation_objective.save
      flash[:notice] = '登録しました。'
      redirect_to action: 'index'
    else
      render :new
    end

  end

  def update
    if @evaluation_objective.update(evaluation_objective_params)
      flash[:notice] = '更新しました。'
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def delete
    @objective.deleted_at = Time.now
    @objective.save
    flash[:notice] = '削除しました。'
    redirect_to action: 'index'
  end

  private
    def set_evaluation_objective
      @evaluation_objective = EvaluationObjective.find(params[:id])
    end

    def evaluation_objective_params
      params.require(:evaluation_objective).permit(:code, :title, :content, :enable, :deleted_at)
    end
end

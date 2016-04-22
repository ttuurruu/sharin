class EvaluationDetailsController < ApplicationController
  before_action :set_evaluation_detail, only: [:show, :edit, :update, :destroy]

  def index
    @evaluation_details = EvaluationDetail.all
  end

  def show
  end

  def new
    @evaluation_header = EvaluationHeader.find_by(id: params[:id])
    @evaluation_detail = EvaluationDetail.new
    @evaluation_detail.evaluation_header_id = params[:id]
end

  def edit
  end

  def create
    @evaluation_detail = EvaluationDetail.new(evaluation_detail_params)

      @evaluation_detail.user_id = session[:user_id]
      @evaluation_detail.category = 1

      if @evaluation_detail.save
        redirect_to edit_evaluation_header_path(@evaluation_detail.evaluation_header_id)
      else
        render :new
      end
  end

  def update
      if @evaluation_detail.update(evaluation_detail_params)
        redirect_to edit_evaluation_header_path(@evaluation_detail.evaluation_header_id)
      else
        render :edit
      end
  end

  def destroy
    @evaluation_detail.destroy
      redirect_to evaluation_details_url, notice: 'Evaluation detail was successfully destroyed.'
  end

  private
    def set_evaluation_detail
      @evaluation_detail = EvaluationDetail.find(params[:id])
    end

    def evaluation_detail_params
      params.require(:evaluation_detail).permit(:evaluation_header_id, :user_id, :category, :title, :content, :weight, :result_rate_self, :result_content_self, :result_rate_primary, :result_content_primary, :result_rate_secondary, :result_content_secondary)
    end
end

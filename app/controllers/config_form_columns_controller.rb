class ConfigFormColumnsController < ApplicationController
  before_action :set_config_form_column, only: [:show, :edit, :update, :destroy]

  # GET /config_form_columns
  # GET /config_form_columns.json
  def index
    @config_form_columns = ConfigFormColumn.all
  end

  # GET /config_form_columns/1
  # GET /config_form_columns/1.json
  def show
  end

  # GET /config_form_columns/new
  def new
    @config_form_column = ConfigFormColumn.new
  end

  # GET /config_form_columns/1/edit
  def edit
  end

  # POST /config_form_columns
  # POST /config_form_columns.json
  def create
    @config_form_column = ConfigFormColumn.new(config_form_column_params)

    respond_to do |format|
      if @config_form_column.save
        format.html { redirect_to @config_form_column, notice: 'Config form column was successfully created.' }
        format.json { render :show, status: :created, location: @config_form_column }
      else
        format.html { render :new }
        format.json { render json: @config_form_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_form_columns/1
  # PATCH/PUT /config_form_columns/1.json
  def update
    respond_to do |format|
      if @config_form_column.update(config_form_column_params)
        format.html { redirect_to @config_form_column, notice: 'Config form column was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_form_column }
      else
        format.html { render :edit }
        format.json { render json: @config_form_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_form_columns/1
  # DELETE /config_form_columns/1.json
  def destroy
    @config_form_column.destroy
    respond_to do |format|
      format.html { redirect_to config_form_columns_url, notice: 'Config form column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_form_column
      @config_form_column = ConfigFormColumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_form_column_params
      params.require(:config_form_column).permit(:config_view_id, :column_name, :attribute_type, :standard, :visible, :order, :custom_name_ja, :custom_name_en, :custom_name_zh, :description_ja, :description_en, :description_zh, :required, :default, :sys_lower, :sys_high, :custom_lower, :custom_high, :grid_class_label, :grid_class_value, :data_source)
    end
end

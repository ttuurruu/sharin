class TableSettingsController < ApplicationController
  before_action :set_table_setting, only: [:show, :edit, :update, :destroy]

  # GET /table_settings
  # GET /table_settings.json
  def index
    @table_settings = TableSetting.all
  end

  # GET /table_settings/1
  # GET /table_settings/1.json
  def show
  end

  # GET /table_settings/new
  def new
    @table_setting = TableSetting.new
  end

  # GET /table_settings/1/edit
  def edit
  end

  # POST /table_settings
  # POST /table_settings.json
  def create
    @table_setting = TableSetting.new(table_setting_params)

    respond_to do |format|
      if @table_setting.save
        format.html { redirect_to @table_setting, notice: 'Table setting was successfully created.' }
        format.json { render :show, status: :created, location: @table_setting }
      else
        format.html { render :new }
        format.json { render json: @table_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_settings/1
  # PATCH/PUT /table_settings/1.json
  def update
    respond_to do |format|
      if @table_setting.update(table_setting_params)
        format.html { redirect_to @table_setting, notice: 'Table setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_setting }
      else
        format.html { render :edit }
        format.json { render json: @table_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_settings/1
  # DELETE /table_settings/1.json
  def destroy
    @table_setting.destroy
    respond_to do |format|
      format.html { redirect_to table_settings_url, notice: 'Table setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_setting
      @table_setting = TableSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_setting_params
      params.require(:table_setting).permit(:table_name, :column_name, :attribute, :standard, :use, :custom_name_ja, :custom_name_en, :description_ja, :description_en, :required, :default, :sys_lower, :sys_high, :custom_lower, :custom_high, :format, :currency, :order_input, :order_list, :order_result)
    end
end

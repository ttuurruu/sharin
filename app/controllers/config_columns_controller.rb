class ConfigColumnsController < ApplicationController
  before_action :set_config_column, only: [:show, :edit, :update, :destroy]

  # GET /config_columns
  # GET /config_columns.json
  def index
    @config_columns = ConfigColumn.all
  end

  # GET /config_columns/1
  # GET /config_columns/1.json
  def show
  end

  # GET /config_columns/new
  def new
    @config_column = ConfigColumn.new
  end

  # GET /config_columns/1/edit
  def edit
  end

  # POST /config_columns
  # POST /config_columns.json
  def create
    @config_column = ConfigColumn.new(config_column_params)

    respond_to do |format|
      if @config_column.save
        format.html { redirect_to @config_column, notice: 'Config column was successfully created.' }
        format.json { render :show, status: :created, location: @config_column }
      else
        format.html { render :new }
        format.json { render json: @config_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_columns/1
  # PATCH/PUT /config_columns/1.json
  def update
    respond_to do |format|
      if @config_column.update(config_column_params)
        format.html { redirect_to @config_column, notice: 'Config column was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_column }
      else
        format.html { render :edit }
        format.json { render json: @config_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_columns/1
  # DELETE /config_columns/1.json
  def destroy
    @config_column.destroy
    respond_to do |format|
      format.html { redirect_to config_columns_url, notice: 'Config column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_column
      @config_column = ConfigColumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_column_params
      params.require(:config_column).permit(:column_name, :default_name_ja, :default_name_en, :default_name_zh, :custom_name_ja, :custom_name_en, :custom_name_zh)
    end
end

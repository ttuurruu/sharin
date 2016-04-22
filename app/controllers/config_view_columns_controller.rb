class ConfigViewColumnsController < ApplicationController
  before_action :set_config_view_column, only: [:show, :edit, :update, :destroy]

  # GET /config_view_columns
  # GET /config_view_columns.json
  def index
    @config_view_columns = ConfigViewColumn.all
  end

  # GET /config_view_columns/1
  # GET /config_view_columns/1.json
  def show
  end

  # GET /config_view_columns/new
  def new
    @config_view_column = ConfigViewColumn.new
  end

  # GET /config_view_columns/1/edit
  def edit
  end

  # POST /config_view_columns
  # POST /config_view_columns.json
  def create
    @config_view_column = ConfigViewColumn.new(config_view_column_params)

    respond_to do |format|
      if @config_view_column.save
        format.html { redirect_to @config_view_column, notice: 'Config view column was successfully created.' }
        format.json { render :show, status: :created, location: @config_view_column }
      else
        format.html { render :new }
        format.json { render json: @config_view_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_view_columns/1
  # PATCH/PUT /config_view_columns/1.json
  def update
    respond_to do |format|
      if @config_view_column.update(config_view_column_params)
        format.html { redirect_to @config_view_column, notice: 'Config view column was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_view_column }
      else
        format.html { render :edit }
        format.json { render json: @config_view_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_view_columns/1
  # DELETE /config_view_columns/1.json
  def destroy
    @config_view_column.destroy
    respond_to do |format|
      format.html { redirect_to config_view_columns_url, notice: 'Config view column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_view_column
      @config_view_column = ConfigViewColumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_view_column_params
      params.require(:config_view_column).permit(:config_view_id, :column_name, :visible, :view_order)
    end
end

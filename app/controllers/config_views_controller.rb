class ConfigViewsController < ApplicationController
  before_action :set_config_view, only: [:show, :edit, :update, :destroy]

  # GET /config_views
  # GET /config_views.json
  def index
    @config_views = ConfigView.all
  end

  # GET /config_views/1
  # GET /config_views/1.json
  def show
  end

  # GET /config_views/new
  def new
    @config_view = ConfigView.new
  end

  # GET /config_views/1/edit
  def edit
  end

  # POST /config_views
  # POST /config_views.json
  def create
    @config_view = ConfigView.new(config_view_params)

    respond_to do |format|
      if @config_view.save
        format.html { redirect_to @config_view, notice: 'Config view was successfully created.' }
        format.json { render :show, status: :created, location: @config_view }
      else
        format.html { render :new }
        format.json { render json: @config_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_views/1
  # PATCH/PUT /config_views/1.json
  def update
    respond_to do |format|
      if @config_view.update(config_view_params)
        format.html { redirect_to @config_view, notice: 'Config view was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_view }
      else
        format.html { render :edit }
        format.json { render json: @config_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_views/1
  # DELETE /config_views/1.json
  def destroy
    @config_view.destroy
    respond_to do |format|
      format.html { redirect_to config_views_url, notice: 'Config view was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_view
      @config_view = ConfigView.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_view_params
      params.require(:config_view).permit(:controller, :action, :title_ja, :title_en, :title_zh, :description_ja, :description_en, :description_zh)
    end
end

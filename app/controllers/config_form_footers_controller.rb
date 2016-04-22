class ConfigFormFootersController < ApplicationController
  before_action :set_config_form_footer, only: [:show, :edit, :update, :destroy]

  # GET /config_form_footers
  # GET /config_form_footers.json
  def index
    @config_form_footers = ConfigFormFooter.all
  end

  # GET /config_form_footers/1
  # GET /config_form_footers/1.json
  def show
  end

  # GET /config_form_footers/new
  def new
    @config_form_footer = ConfigFormFooter.new
  end

  # GET /config_form_footers/1/edit
  def edit
  end

  # POST /config_form_footers
  # POST /config_form_footers.json
  def create
    @config_form_footer = ConfigFormFooter.new(config_form_footer_params)

    respond_to do |format|
      if @config_form_footer.save
        format.html { redirect_to @config_form_footer, notice: 'Config form footer was successfully created.' }
        format.json { render :show, status: :created, location: @config_form_footer }
      else
        format.html { render :new }
        format.json { render json: @config_form_footer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_form_footers/1
  # PATCH/PUT /config_form_footers/1.json
  def update
    respond_to do |format|
      if @config_form_footer.update(config_form_footer_params)
        format.html { redirect_to @config_form_footer, notice: 'Config form footer was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_form_footer }
      else
        format.html { render :edit }
        format.json { render json: @config_form_footer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_form_footers/1
  # DELETE /config_form_footers/1.json
  def destroy
    @config_form_footer.destroy
    respond_to do |format|
      format.html { redirect_to config_form_footers_url, notice: 'Config form footer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_form_footer
      @config_form_footer = ConfigFormFooter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_form_footer_params
      params.require(:config_form_footer).permit(:form_id)
    end
end

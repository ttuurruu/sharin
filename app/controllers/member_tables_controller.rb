class MemberTablesController < ApplicationController
  before_action :set_member_table, only: [:show, :edit, :update, :destroy]

  # GET /member_tables
  # GET /member_tables.json
  def index
    @member_tables = MemberTable.all
  end

  # GET /member_tables/1
  # GET /member_tables/1.json
  def show
  end

  # GET /member_tables/new
  def new
    @member_table = MemberTable.new
  end

  # GET /member_tables/1/edit
  def edit
  end

  # POST /member_tables
  # POST /member_tables.json
  def create
    @member_table = MemberTable.new(member_table_params)

    respond_to do |format|
      if @member_table.save
        format.html { redirect_to @member_table, notice: 'Member table was successfully created.' }
        format.json { render :show, status: :created, location: @member_table }
      else
        format.html { render :new }
        format.json { render json: @member_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_tables/1
  # PATCH/PUT /member_tables/1.json
  def update
    respond_to do |format|
      if @member_table.update(member_table_params)
        format.html { redirect_to @member_table, notice: 'Member table was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_table }
      else
        format.html { render :edit }
        format.json { render json: @member_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_tables/1
  # DELETE /member_tables/1.json
  def destroy
    @member_table.destroy
    respond_to do |format|
      format.html { redirect_to member_tables_url, notice: 'Member table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_table
      @member_table = MemberTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_table_params
      params.require(:member_table).permit(:code, :name, :category, :hierarchy_level, :controller, :action, :param, :font_awesome, :description)
    end
end

class MemberRolesController < ApplicationController
  before_action :set_member_role, only: [:show, :edit, :update, :destroy]

  def index

    @q = MemberRole.order(order: :desc).ransack(params[:q])
    @results = @q.result(distinct: true).page(params[:page])

  end

  def show
    #member_roles
    @table_settings = TableSetting.get_list('member_roles')

    #member_role_details
    @member_tables = MemberTable.all
    @member_role_details = MemberRoleDetail.where(member_role_id: 1)
  end

  def new

    @table_settings = TableSetting.get_input_list('member_roles')

    @record = MemberRole.new

  end

  def edit
    @member_tables = MemberTable.all
  end

  def create
    @member_role = MemberRole.new(member_role_params)
      if @member_role.save
        redirect_to member_roles_path, notice: 'Member role was successfully created.'
      else
        render :new
      end
  end

  def update

    #削除

    #追加
    @member_role = MemberRole.new

    #respond_to do |format|
      #if @member_role.update(member_role_params)
      #  format.html { redirect_to @member_role, notice: 'Member role was successfully updated.' }
      #  format.json { render :show, status: :ok, location: @member_role }
      #else
      #  format.html { render :edit }
      #  format.json { render json: @member_role.errors, status: :unprocessable_entity }
      #end
    #end

  end

  def destroy
    @member_role.destroy
    respond_to do |format|
      format.html { redirect_to member_roles_url, notice: 'Member role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_member_role
      @record = MemberRole.find(params[:id])
    end

    def member_role_params
      params.require(:member_role).permit(:name, :description, :order, :enable)
    end
end

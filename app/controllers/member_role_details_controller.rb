class MemberRoleDetailsController < ApplicationController
  before_action :set_member_role_detail, only: [:show, :edit, :destroy]

  def index
    @member_role_details = MemberRoleDetail.all
  end

  def show
  end

  def new
    @member_role_detail = MemberRoleDetail.new
  end

  def edit
    @member_tables = MemberTable.all
  end

  def block_edit
    @member_tables = MemberTable.all
  end

  def create
    @member_role_detail = MemberRoleDetail.new(member_role_detail_params)

    respond_to do |format|
      if @member_role_detail.save
        format.html { redirect_to @member_role_detail, notice: 'Member role detail was successfully created.' }
        format.json { render :show, status: :created, location: @member_role_detail }
      else
        format.html { render :new }
        format.json { render json: @member_role_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    #Delete
    MemberRoleDetail.where(member_role_id: params[:id]).update_all(deleted_at: Time.now )

    #Insert
    records = MemberTable.all
    records.each do |record|
      if params[:use_type][record.id.to_s] == "1"
        member_role_detail = MemberRoleDetail.new
        member_role_detail.member_role_id = params[:id]
        member_role_detail.member_table_id = record.id
        member_role_detail.use_type = params[:use_type][record.id.to_s]
        member_role_detail.scope_type = params[:scope_type][record.id.to_s]
        member_role_detail.level_type = params[:level_type][record.id.to_s]
        member_role_detail.time_type = params[:time_type][record.id.to_s]
        member_role_detail.crud_type = params[:crud_type][record.id.to_s]
        member_role_detail.save
      end
    end

    redirect_to member_role_path(params[:id])

  end

  def destroy
    @member_role_detail.destroy
    respond_to do |format|
      format.html { redirect_to member_role_details_url, notice: 'Member role detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_member_role_detail
      @member_role_detail = MemberRoleDetail.find(params[:id])
    end

    def member_role_detail_params
      params.require(:member_role_detail).permit(:member_table_id, :use_type, :scope_type, :level_type, :time_type, :crud_type)
    end
end

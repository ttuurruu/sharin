class AbilityGroupingsController < ApplicationController
  before_action :set_ability_grouping, only: [:show, :edit, :update, :destroy]

  def index
    @ability_groupings = AbilityGrouping.all
  end

  def show
  end

  def new
    @ability_grouping = AbilityGrouping.new
  end

  def edit
  end

  def create
    @ability_grouping = AbilityGrouping.new(ability_grouping_params)

      if @ability_grouping.save
        redirect_to @ability_grouping, notice: 'Ability grouping was successfully created.'
      else
        render :new
      end
  end

  def update
    if @ability_grouping.update(ability_grouping_params)
      redirect_to @ability_grouping, notice: 'Ability grouping was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ability_grouping.destroy
      redirect_to ability_groupings_url, notice: 'Ability grouping was successfully destroyed.'
  end

  private
    def set_ability_grouping
      @ability_grouping = AbilityGrouping.find(params[:id])
    end

    def ability_grouping_params
      params.require(:ability_grouping).permit(:category, :code, :name, :ability_requirements_id)
    end
end

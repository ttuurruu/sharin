class AbilityRequirementsController < ApplicationController
  before_action :set_ability_requirement, only: [:show, :edit, :update, :destroy]

  def index
    @ability_requirements = AbilityRequirement.all
  end

  def show
  end

  def new
    @ability_requirement = AbilityRequirement.new
  end

  def edit
  end

  def create
    @ability_requirement = AbilityRequirement.new(ability_requirement_params)

      if @ability_requirement.save
        redirect_to @ability_requirement, notice: 'Ability requirement was successfully created.'
      else
        render :new
      end
  end

  def update
      if @ability_requirement.update(ability_requirement_params)
        redirect_to @ability_requirement, notice: 'Ability requirement was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @ability_requirement.destroy
      redirect_to ability_requirements_url, notice: 'Ability requirement was successfully destroyed.'
   end

  private
    def set_ability_requirement
      @ability_requirement = AbilityRequirement.find(params[:id])
    end

    def ability_requirement_params
      params.require(:ability_requirement).permit(:category, :code, :title, :content)
    end
end

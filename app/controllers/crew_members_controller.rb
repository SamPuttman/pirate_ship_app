class CrewMembersController < ApplicationController
  def index
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
    @crew_members = @pirate_ship.crew_members
  end

  def show
    @crew_member = CrewMember.find(params[:id])
  end

  def all_index 
    @crew_members = CrewMember.all
  end

  def create
    @crew_member = CrewMember.new(crew_params)
      @crew_member.save
    redirect_to crew_member_path
  end

  def edit
    @crew_member = CrewMember.find(params[:id])
  end

  private

  def crew_params
    params.permit(:pirate_ship_id, :name, :age, :role, :missing_limbs)
  end
end
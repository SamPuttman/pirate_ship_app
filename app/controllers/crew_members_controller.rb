class CrewMembersController < ApplicationController
  def index
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
    @crew_members = @pirate_ship.crew_members
  end
  def show
    @crew_member = CrewMember.find_by(id: params[:id])
  end
  
end
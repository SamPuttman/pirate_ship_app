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
  
end
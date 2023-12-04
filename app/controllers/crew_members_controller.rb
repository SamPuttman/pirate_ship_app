class CrewMembersController < ApplicationController
  def index
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
    @crew_members = @pirate_ship.crew_members
  end

  def show
    @crew_member = CrewMember.find(params[:id])
    @pirate_ship = @crew_member.pirate_ship
  end

  def all_index 
    @crew_members = CrewMember.all
  end

  def create
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
    @crew_member = @pirate_ship.crew_members.new(crew_params)
    
    if @crew_member.save
      redirect_to pirate_ship_crew_members_path(@pirate_ship)
    else
      render :new
    end
  end

  def edit
    @crew_member = CrewMember.find(params[:id])
  end

  def new
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
    @crew_member = CrewMember.new
  end

  def edit
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
    @crew_member = CrewMember.find(params[:id])
  end

  def update
    @crew_member = CrewMember.find(params[:id])
    @pirate_ship = @crew_member.pirate_ship

    if @crew_member.update(crew_params)
      redirect_to pirate_ship_crew_members_path(@pirate_ship)
    else
      render :edit
    end
  end

  private

  def crew_params
    params.require(:crew_member).permit(:name, :age, :role, :missing_limbs)
  end
end
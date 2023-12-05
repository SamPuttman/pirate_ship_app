class PirateShipsCrewController < ApplicationController
  before_action :set_pirate_ship

  def index
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])

    if params[:sort] == 'name'
      @crew_members = @pirate_ship.crew_members.where(active: true).order(:name)
    else
      @crew_members = @pirate_ship.crew_members.where(active: true)
    end
  end

  def new
    @crew_member = @pirate_ship.crew_members.new
  end

  def create
    @crew_member = @pirate_ship.crew_members.new(crew_params)
    if @crew_member.save
      redirect_to pirate_ship_crew_members_path(@pirate_ship)
    else
      render :new
    end
  end

  def edit
    @crew_member = @pirate_ship.crew_members.find(params[:id])
  end

  def update
    @crew_member = @pirate_ship.crew_members.find(params[:id])
    if @crew_member.update(crew_params)
      redirect_to pirate_ship_crew_members_path(@pirate_ship)
    end
  end

  def show
    @crew_member = @pirate_ship.crew_members.find(params[:id])
  end

  def destroy
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
    @crew_member = @pirate_ship.crew_members.find(params[:id])
    @crew_member.destroy

    redirect_to pirate_ship_crew_members_path(@pirate_ship)
  end

  private

  def set_pirate_ship
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
  end

  def crew_params
    params.require(:crew_member).permit(:name, :age, :role, :active)
  end
end
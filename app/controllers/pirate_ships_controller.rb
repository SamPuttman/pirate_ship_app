class PirateShipsController < ApplicationController
  def index
    @pirate_ships = PirateShip.order(id: :asc)
  end

  def show
    @pirate_ship = PirateShip.find(params[:id])
  end

  def new
    @pirate_ship = PirateShip.new
  end

  def create
    @pirate_ship = PirateShip.new(pirate_ship_params)
      @pirate_ship.save
    redirect_to pirate_ships_path
  end

  def edit
    @pirate_ship = PirateShip.find(params[:id])
  end

  def update
    @pirate_ship = PirateShip.find(params[:id])
      @pirate_ship.update(pirate_ship_params)
    redirect_to @pirate_ship
  end

### HELPER METHODS ###

private

  def pirate_ship_params
    params.require(:pirate_ship).permit(:name, :ship_type, :flag, :maximum_crew, :sunk)
  end
end


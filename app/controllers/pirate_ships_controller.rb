class PirateShipsController < ApplicationController
  def index
    @pirate_ships = PirateShip.all
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

### HELPER METHODS ###

private

  def pirate_ship_params
    params.permit(:name, :ship_type, :flag, :maximum_crew, :sunk)
  end
end


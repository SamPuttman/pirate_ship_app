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
    @pirate_ship = PirateShip.new(name: params[:pirate_ship][:name], ship_type: params[:pirate_ship][:ship_type],
                                  flag: params[:pirate_ship][:flag], maximum_crew: params[:pirate_ship][:maximum_crew],
                                  sunk: params[:pirate_ship][:sunk])
      @pirate_ship.save
    redirect_to pirate_ships_path
  end

### HELPER METHODS ###

  def pirate_ship_params
    params.require(:pirate_ship).permit(:name, :ship_type, :flag, :maximum_crew, :sunk)
  end
end


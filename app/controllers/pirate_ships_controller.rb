class PirateShipsController < ApplicationController
  def index
    @pirate_ships = PirateShip.all
  end

  def show
    @pirate_ship = PirateShip.find_by(id: params[:id])
  end
end


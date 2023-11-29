class PirateShipsController < ApplicationController
  def index
    @pirate_ships = PirateShip.all
  end
end

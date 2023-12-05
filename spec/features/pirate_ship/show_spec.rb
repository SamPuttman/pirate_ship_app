require 'rails_helper'

RSpec.feature "PirateShipsShow", type: :feature do
  it "visitor sees details of a specific pirate ship" do

    ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, sunk: false)

    visit "/pirate_ships/#{ship.id}"

    expect(page).to have_content("Black Pearl")
    expect(page).to have_content("Galleon")
    expect(page).to have_content("Jolly Roger")
    expect(page).to have_content("Jolly Roger")
    expect(page).to have_content(50)
    expect(page).to have_content(false)
  end
end
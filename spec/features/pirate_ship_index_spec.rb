require 'rails_helper'

RSpec.feature "ParentIndex", type: :feature do
  scenario "visitor sees names of pirate ships" do

    PirateShip.create(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, sunk: false)
    PirateShip.create(name: "The Flying Dutchman", ship_type: "Frigate", flag: "Jolly Roger", maximum_crew: 200, sunk: false)
    visit '/pirate_ships'

    expect(page).to have_content("The Black Pearl")
    expect(page).to have_content("The Flying Dutchman")
  end
end
require "rails_helper"

RSpec.describe "PirateShipsIndex", type: :feature do
  it "visitor sees names of pirate ships" do

    PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    PirateShip.create!(name: "The Flying Dutchman", ship_type: "Frigate", flag: "Jolly Roger", maximum_crew: 200, afloat: true)
    visit '/pirate_ships'

    expect(page).to have_content("The Black Pearl")
    expect(page).to have_content("Galleon")
    expect(page).to have_content("Jolly Roger")
    expect(page).to have_content(50)
    expect(page).to have_content(true)

    expect(page).to have_content("The Flying Dutchman")
    expect(page).to have_content("Frigate")
    expect(page).to have_content("Jolly Roger")
    expect(page).to have_content(200)
    expect(page).to have_content(true)
  end
end
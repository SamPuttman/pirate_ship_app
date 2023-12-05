require 'rails_helper'

RSpec.feature "PirateShipsNew", type: :feature do
  before do
    @ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    @ship_2 = PirateShip.create!(name: "The Cutlass", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)

  end

  it "User creates a new pirate ship" do
    visit "/pirate_ships/new"

    expect(page).to have_content("New Pirate Ship")
    
    fill_in "Name", with: "Queen Anne's Revenge"
    fill_in "Ship type", with: "Galleon"
    fill_in "Flag", with: "Jolly Roger"
    fill_in "Maximum crew", with: "300"
    select "false", from: "Afloat"

    click_button "Create Pirate Ship"

    visit "/pirate_ships"

    expect(page).to have_content("Queen Anne's Revenge")
    expect(page).to have_content("Galleon")
    expect(page).to have_content("Jolly Roger")
    expect(page).to have_content("300")
    expect(page).to have_content("false")
  end
end
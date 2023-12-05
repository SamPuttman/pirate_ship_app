require 'rails_helper'

RSpec.feature "PirateShipsEdit", type: :feature do
  before do
    @ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    @ship_2 = PirateShip.create!(name: "The Cutlass", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
  end

  it "User edits a pirate ship" do
    visit "/pirate_ships/#{@ship_2.id}/edit"

    expect(page).to have_content("Edit Pirate Ship")

    fill_in "Name", with: "Queen Anne's Revenge"
    click_button "Update Pirate Ship"

    visit "/pirate_ships"

    expect(page).to have_content("Queen Anne's Revenge")
  end
end
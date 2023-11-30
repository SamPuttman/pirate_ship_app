require 'rails_helper'

RSpec.feature "ChildIndex", type: :feature do
    
  before do
    ship = PirateShip.create(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, sunk: false)
    CrewMember.create(pirate_ship_id: 1, name: "Jack Sparrow", age: 38, role: "Captain", missing_limbs: false)
    CrewMember.create(pirate_ship_id: 1, name: "Will Turner", age: 28, role: "First Mate", missing_limbs: false)
  end

  scenario "visitor sees details of all crew members" do
    visit '/crew_members'
    save_and_open_page

    expect(page).to have_content("Jack Sparrow")
    expect(page).to have_content("Captain")
    expect(page).to have_content("Will Turner")
    expect(page).to have_content("First Mate")
  end
end
require 'rails_helper'

RSpec.feature "PirateShipsCrewEdit", type: :feature do
  before do
    @ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, sunk: false)
    @crew_member_1 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Jack Sparrow", age: 38, role: "Captain", active: true)
    @crew_member_2 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Will Turner", age: 28, role: "First Mate", active: true)

    @ship_2 = PirateShip.create!(name: "The Cutlass", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, sunk: false)
    @crew_member_3 = CrewMember.create!(pirate_ship_id: @ship_2.id, name: "Billy Bob", age: 27, role: "Swashbuckler", active: false)
  end

  it "User creates a crew member" do
    visit "/pirate_ships/#{@ship.id}/crew_members/new"

    expect(page).to have_content("New Crew Member")
    
    # yarrrr this be a mutiny
    fill_in "Name", with: "Hector Barbossa"
    fill_in "Age", with: "54"
    fill_in "Role", with: "First Mate"
    select "false", from: "Active"

    click_button "Create Crew Member"

    visit "/pirate_ships/#{@ship.id}/crew_members"

    expect(page).to have_content("Hector Barbossa")
    expect(page).to have_content("Jack Sparrow")
    expect(page).to have_content("Will Turner")
  end
end
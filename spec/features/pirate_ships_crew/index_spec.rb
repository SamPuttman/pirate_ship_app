require 'rails_helper'

RSpec.feature "PirateShipsCrewIndex", type: :feature do
  before do
    @ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    @crew_member_1 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Jack Sparrow", age: 38, role: "Captain", active: true)
    @crew_member_2 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Will Turner", age: 28, role: "First Mate", active: true)

    @ship_2 = PirateShip.create!(name: "The Cutlass", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    @crew_member_3 = CrewMember.create!(pirate_ship_id: @ship_2.id, name: "Billy Bob", age: 27, role: "Swashbuckler", active: false)
  end

  it "User views the list of crew members for a pirate ship" do
    visit "/pirate_ships/#{@ship.id}/crew_members"

    expect(page).to have_content(@crew_member_1.name)
    expect(page).to have_content(@crew_member_1.age)
    expect(page).to have_content(@crew_member_1.role)
    expect(page).to have_content(@crew_member_1.active)

    expect(page).to have_content(@crew_member_2.name)
    expect(page).to have_content(@crew_member_2.age)
    expect(page).to have_content(@crew_member_2.role)
    expect(page).to have_content(@crew_member_2.active)

    expect(page).not_to have_content(@crew_member_3.name)
    expect(page).not_to have_content(@crew_member_3.age)
    expect(page).not_to have_content(@crew_member_3.role)
    expect(page).not_to have_content(@crew_member_3.active)
  end
end
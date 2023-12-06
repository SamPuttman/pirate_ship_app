require "rails_helper"

RSpec.describe "CrewMemberShow", type: :feature do
  
  before do
    @ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    @crew_member_1 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Jack Sparrow", age: 38, role: "Captain", active: true)
    @crew_member_2 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Will Turner", age: 28, role: "First Mate", active: true)
  end

  it "User views a crew member's details" do
    visit "/pirate_ships/#{@ship.id}/crew_members/#{@crew_member_1.id}"

    expect(page).to have_content(@crew_member_1.name)
    expect(page).to have_content(@crew_member_1.age)
    expect(page).to have_content(@crew_member_1.role)
    expect(page).to have_content(@crew_member_1.active)

    expect(page).not_to have_content(@crew_member_2.name)
    expect(page).not_to have_content(@crew_member_2.age)
    expect(page).not_to have_content(@crew_member_2.role)
  end
end
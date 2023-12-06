require "rails_helper"

RSpec.describe "PirateShipCrewMembers", type: :feature do
  before do
    @pirate_ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)

    @crew_member_1 = CrewMember.create!(pirate_ship: @pirate_ship, name: "Jack Sparrow", active: true)
    @crew_member_2 = CrewMember.create!(pirate_ship: @pirate_ship, name: "Will Turner", active: true)
    @crew_member_3 = CrewMember.create!(pirate_ship: @pirate_ship, name: "Davy Jones", active: false)
  end

  it "User sees only active crew members sorted by name in the index" do
    visit "/pirate_ships/#{@pirate_ship.id}/crew_members"

    expect(page).to have_content(@crew_member_1.name)
    expect(page).to have_content(@crew_member_2.name)
    expect(page).not_to have_content(@crew_member_3.name)

    #this part was awful. I couldn't figure out how to test
    #if they were in the correct order. page.all("tr")
    #collects all list items into an array, with each
    #row in the table being a seperate element. The
    #headers are [0].

    crew_members = page.all("tr")
    expect(crew_members[1]).to have_content("Jack Sparrow")
    expect(crew_members[2]).to have_content("Will Turner")
  end
end
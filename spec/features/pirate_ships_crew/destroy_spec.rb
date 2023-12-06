require "rails_helper"

RSpec.describe "PirateShipCrewDestroy", type: :feature do
  it "User deletes a crew member" do
    @ship_1 = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    @crew_member_1 = CrewMember.create!(pirate_ship_id: @ship_1.id, name: "Jack Sparrow", age: 38, role: "Captain", active: true)
    @crew_member_2 = CrewMember.create!(pirate_ship_id: @ship_1.id, name: "Will Turner", age: 28, role: "First Mate", active: true)
  
    visit "/pirate_ships/#{@ship_1.id}/crew_members"

    #https://coderwall.com/p/bfaqwa/capybara-select-first-element-ambiguity-resolution
    first(:link, "Walk the plank").click

    visit current_path
    visit "/pirate_ships/#{@ship_1.id}/crew_members"

    expect(page).to_not have_content("Jack Sparrow")
  end
end

#cannot get this test to work. 
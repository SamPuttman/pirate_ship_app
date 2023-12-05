require 'rails_helper'


RSpec.feature "ChildIndex", type: :feature do
    
  before do
    @ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, sunk: false)
    CrewMember.create!(pirate_ship_id: @ship.id, name: "Jack Sparrow", age: 38, role: "Captain", active: true)
    CrewMember.create!(pirate_ship_id: @ship.id, name: "Will Turner", age: 28, role: "First Mate", active: true)
  end

  it "visitor sees details of all crew members" do
    visit '/crew_members/all'

    expect(page).to have_content("Jack Sparrow")
    expect(page).to have_content(38)
    expect(page).to have_content("Captain")
    expect(page).to have_content(true)

    expect(page).to have_content("Will Turner")
    expect(page).to have_content(28)
    expect(page).to have_content("First Mate")
    expect(page).to have_content(true)

    expect(page).to_not have_content("Davy Jones")
    expect(page).to_not have_content("Edward Teach")
  end
end
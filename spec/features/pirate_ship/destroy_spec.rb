require "rails_helper"

RSpec.describe "PirateShips", type: :feature do
 
  it "User deletes a pirate ship" do
    ship_1 = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    ship_2 = PirateShip.create!(name: "The Cutlass", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
    
    visit "/pirate_ships"
    first(:link, "Destroy ship").click

    expect(page).to_not have_content("The Black Pearl")
  end
end

#cannot get this test to work. When visiting 
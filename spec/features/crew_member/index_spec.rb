require "rails_helper"

RSpec.describe "CrewMembersController", type: :feature do
  describe "index" do
    it "shows only active crew members" do

      @ship = PirateShip.create!(name: "The Black Pearl", ship_type: "Galleon", flag: "Jolly Roger", maximum_crew: 50, afloat: true)
      @crew_member_1 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Jack Sparrow", age: 38, role: "Captain", active: true)
      @crew_member_2 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Will Turner", age: 28, role: "First Mate", active: true)
      @crew_member_3 = CrewMember.create!(pirate_ship_id: @ship.id, name: "Hector Barbossa", age: 58, role: "Former First Mate", active: false)

      visit "/pirate_ships/#{@ship.id}/crew_members/"

      expect(page).to have_content(@crew_member_1.name)
      expect(page).to have_content(@crew_member_2.name)
      expect(page).not_to have_content(@crew_member_3.name)
    end
  end
end
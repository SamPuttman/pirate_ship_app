require 'rails_helper'


RSpec.describe PirateShip, type: :model do
  it "should have many crew members" do
    should have_many(:crew_members)
  end
end
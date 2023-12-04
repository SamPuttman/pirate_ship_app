require 'rails_helper'

RSpec.describe CrewMember, type: :model do
  it "should belong to a pirate ship" do
    should belong_to(:pirate_ship)
  end
end
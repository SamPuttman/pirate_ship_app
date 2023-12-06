class CrewMembersController < ApplicationController
  def all_index
    @crew_members = CrewMember.all
  end
end
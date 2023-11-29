class CrewMembersController < ApplicationController
  def index
    @crew_members = CrewMember.all
  end
end

class CrewMembersController < ApplicationController
  def all_index
    @crew_members = CrewMember.all
  end

  def index
    @crew_members = CrewMember.where(active: true)
  end

  def show
    @crew_member = CrewMember.find(params[:id])
  end

  private

  def crew_params
    params.require(:crew_member).permit(:name, :age, :role, :active)
  end
end
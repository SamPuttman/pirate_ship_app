class PirateShip < ApplicationRecord
  #changed in user story 19 to ensure children are deleted when parent is.
  has_many :crew_members, dependent: :destroy
end

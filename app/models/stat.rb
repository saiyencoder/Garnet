class Stat < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :team, optional: true
end

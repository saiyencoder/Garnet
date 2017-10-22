class PlayerGame < ApplicationRecord
  belongs_to :player
  belogos_to :game
end

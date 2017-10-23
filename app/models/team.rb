class Team < ApplicationRecord
  has_many :players
  has_many :games
  has_many :stats, through: :games
end

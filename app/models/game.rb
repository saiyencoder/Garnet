class Game < ApplicationRecord
  belongs_to :season
  belongs_to :team
  has_many :playergames
  has_many :players, through: :playergames
  has_many :stats, inverse_of: :game
  accepts_nested_attributes_for :stats


end

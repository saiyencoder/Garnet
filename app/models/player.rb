class Player < ApplicationRecord
  has_secure_password
  belongs_to :team
  has_many :playergames
  has_many :games, through: :playergames
  has_many :stats
end

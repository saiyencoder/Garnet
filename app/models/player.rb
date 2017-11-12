class Player < ApplicationRecord
  has_secure_password
  belongs_to :team
  has_many :playergames
  has_many :games, through: :playergames
  has_many :stats

  def averages
    total_points = 0
    total_rebounds = 0
    total_assists = 0
    total_steals = 0
    total_blocks = 0
    total_fouls = 0

    games = self.stats.length
    self.stats.each do |stat|
      total_points += stat.points
      total_rebounds += stat.rebounds
      total_assists += stat.assists
      total_steals += stat.steals
      total_blocks += stat.blocks
      total_fouls += stat.fouls
    end

    self.points_per_game = (total_points).to_f/(games).to_f
    self.rebounds_per_game = (total_rebounds).to_f/(games).to_f
    self.assists_per_game = (total_assists).to_f/(games).to_f
    self.steals_per_game = (total_steals).to_f/(games).to_f
    self.blocks_per_game = (total_blocks).to_f/(games).to_f
    self.fouls_per_game = (total_fouls).to_f/(games).to_f    
    
  end

end

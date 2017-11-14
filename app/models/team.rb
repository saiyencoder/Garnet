class Team < ApplicationRecord
  has_many :players
  has_many :games
  has_many :stats, through: :games

  def team_averages
    team_total_points = 0
    team_rebounds = 0
    team_assists = 0
    team_steals = 0
    team_blocks = 0
    team_fouls = 0 
    total_games = self.games.length 
    self.games.each do |game|
      game.stats.each do |stat|
        team_total_points += stat.points
        team_rebounds += stat.rebounds
        team_assists += stat.assists
        team_steals += stat.steals
        team_blocks += stat.blocks
        team_fouls += stat.fouls
      end
    end

    self.team_points_per_game = (team_total_points).to_f/(total_games).to_f
    self.team_rebounds_per_game = (team_rebounds).to_f/(total_games).to_f
    self.team_assists_per_game = (team_assists).to_f/(total_games).to_f
    self.team_steals_per_game = (team_steals).to_f/(total_games).to_f
    self.team_blocks_per_game = (team_blocks).to_f/(total_games).to_f
    self.team_fouls_per_game = (team_fouls).to_f/(total_games).to_f

  end



end

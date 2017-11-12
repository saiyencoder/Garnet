class RemoveTeamStatsFromStats < ActiveRecord::Migration[5.1]
  def change
    remove_column :stats, :team_total_points, :decimal
    remove_column :stats, :team_points_per_game, :decimal
    remove_column :stats, :team_rebounds_per_game, :decimal
    remove_column :stats, :team_assists_per_game, :decimal
    remove_column :stats, :team_steals_per_game, :decimal
    remove_column :stats, :team_blocks_per_game, :decimal
    remove_column :stats, :team_fouls_per_game, :decimal
    add_column :teams, :team_total_points, :decimal, precision:4, scale:1
    add_column :teams, :team_points_per_game, :decimal, precision:4, scale:1
    add_column :teams, :team_rebounds_per_game, :decimal, precision:4, scale:1
    add_column :teams, :team_assists_per_game, :decimal, precision:4, scale:1
    add_column :teams, :team_steals_per_game, :decimal, precision:4, scale:1
    add_column :teams, :team_blocks_per_game, :decimal, precision:4, scale:1
    add_column :teams, :team_fouls_per_game, :decimal, precision:4, scale:1
  end
end

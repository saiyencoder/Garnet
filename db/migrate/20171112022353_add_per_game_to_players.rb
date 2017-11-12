class AddPerGameToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :points_per_game, :decimal, precision: 4, scale:1
    add_column :players, :rebounds_per_game, :decimal, precision: 4, scale:1
    add_column :players, :assists_per_game, :decimal, precision: 4, scale:1
    add_column :players, :steals_per_game, :decimal, precision: 4, scale:1
    add_column :players, :blocks_per_game, :decimal, precision: 4, scale:1
    add_column :players, :fouls_per_game, :decimal, precision: 4, scale:1
    add_column :teams, :team_against, :integer
    add_column :stats, :team_total_points, :integer
    add_column :stats, :team_points_per_game, :decimal, precision: 4, scale:1
    add_column :stats, :team_rebounds_per_game, :decimal, precision: 4, scale:1
    add_column :stats, :team_assists_per_game, :decimal, precision: 4, scale:1
    add_column :stats, :team_steals_per_game, :decimal, precision: 4, scale:1
    add_column :stats, :team_blocks_per_game, :decimal, precision: 4, scale:1
    add_column :stats, :team_fouls_per_game, :decimal, precision: 4, scale:1
  end
end

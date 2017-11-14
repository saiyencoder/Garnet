class AddGameTotalPointsInGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :stats, :total_points_in_game, :integer
    remove_column :teams, :team_total_points, :decimal
    add_column :games, :in_game_points, :integer 
  end
end

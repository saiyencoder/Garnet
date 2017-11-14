class AddTotalsToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :game_total_points, :integer
    add_column :teams, :game_total_rebounds, :integer
    add_column :teams, :game_total_assists, :integer
    add_column :teams, :game_total_steals, :integer
    add_column :teams, :game_total_blocks, :integer
    add_column :teams, :game_total_fouls, :integer
  end
end

class RemoveTeamTotalPointsFromTeams < ActiveRecord::Migration[5.1]
  def change
    #Adding total_points_in_game for stats table. Disregard title
    add_column :stats, :total_points_in_game, :integer 
  end
end

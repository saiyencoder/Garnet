class RemoveTeamIdFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :team_id, :integer
  end
end

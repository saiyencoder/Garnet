class AddTeamIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :team_id, :integer
  end
end

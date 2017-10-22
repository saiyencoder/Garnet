class ChangeTeamInGames < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :team_1, :team_id
    remove_column :games, :team_2, :integer
  end
end

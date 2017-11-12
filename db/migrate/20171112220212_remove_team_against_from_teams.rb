class RemoveTeamAgainstFromTeams < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :team_against, :integer
    add_column :games, :team_against, :integer
  end
end

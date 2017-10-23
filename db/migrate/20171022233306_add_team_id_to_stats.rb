class AddTeamIdToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :team_id, :integer
  end
end

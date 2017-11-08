class AddGameidToPlayerstats < ActiveRecord::Migration[5.1]
  def change
    add_column  :player_stats, :game_id, :integer 
  end
end

class DropPlayerstats < ActiveRecord::Migration[5.1]
  def change
    drop_table :player_stats
  end
end

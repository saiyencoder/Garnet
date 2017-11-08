class CreatePlayerStats < ActiveRecord::Migration[5.1]
  def change
    create_table :player_stats do |t|
      t.integer "stat_id"
      t.integer "player_id"

      t.timestamps
    end
  end
end

class AddGameCompleteToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :score, :integer
    add_column :stats, :game_complete, :boolean
    remove_column :games, :in_game_points, :integer
  end
end

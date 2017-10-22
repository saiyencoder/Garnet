class AddScorerToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :week, :integer
    add_column :games, :scorer, :string
    add_column :games, :team_1, :integer
    add_column :games, :team_2, :integer
  end
end

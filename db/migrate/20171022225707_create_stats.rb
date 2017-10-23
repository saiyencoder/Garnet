class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :points
      t.integer :three_points
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.decimal :field_goal_percentage, precision: 6, scale: 2
      t.decimal :three_point_field_goal_percentage, precision: 6, scale: 2
      t.decimal :free_throw_percentage, precision: 6, scale: 2
      t.integer :fouls
      t.integer :field_goal_made
      t.integer :field_goal_attempt
      t.integer :three_point_made
      t.integer :three_point_attempt
      t.integer :win
      t.integer :loss

      t.timestamps
    end
  end
end

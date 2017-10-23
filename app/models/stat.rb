class Stat < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :team, optional: true

  def calculate_total
    self.points = (field_goal_made * 2) + (three_point_made * 3) + (free_throws_made)
    self.field_goal_percentage = ((field_goal_made.to_f) / (field_goal_attempt.to_f)) * 100
    self.three_point_field_goal_percentage = ((three_point_made.to_f) / (three_point_attempt.to_f)) * 100
    self.free_throw_percentage = ((free_throws_made.to_f) / (free_throw_attempts.to_f)) * 100
    save
  end
end

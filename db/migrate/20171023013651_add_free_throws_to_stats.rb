class AddFreeThrowsToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :free_throws_made, :integer
    add_column :stats, :free_throw_attempts, :integer
  end
end

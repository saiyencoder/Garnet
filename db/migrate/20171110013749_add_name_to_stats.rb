class AddNameToStats < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :player_name, :string
  end
end

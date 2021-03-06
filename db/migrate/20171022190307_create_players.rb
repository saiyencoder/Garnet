class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :team_id
      t.boolean :commissioner
      t.boolean :captain
      t.string :password_digest
      t.timestamps
    end
  end
end

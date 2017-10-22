class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string "quarter"
      t.integer "year"
      t.timestamps
    end
  end
end

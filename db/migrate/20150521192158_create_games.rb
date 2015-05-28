class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :puzzle_id
      t.string :status
      t.string :progress
      t.string :key
      
      t.timestamps null: false
    end
  end
end

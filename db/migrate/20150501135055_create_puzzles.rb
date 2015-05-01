class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :solution
      t.string :category
      t.date :date

      t.timestamps null: false
    end
  end
end

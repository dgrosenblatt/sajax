class AddRevealToGames < ActiveRecord::Migration
  def change
    add_column :games, :reveal, :string
  end
end

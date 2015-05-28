class ChangeGamesRevealDefault < ActiveRecord::Migration
  def change
    change_column_default :games, :reveal, ""
  end
end

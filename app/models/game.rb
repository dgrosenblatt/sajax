class Game < ActiveRecord::Base
  # before_create assign_puzzle, generate_key

  belongs_to :puzzle
end

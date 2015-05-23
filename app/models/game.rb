class Game < ActiveRecord::Base
  before_create :assign_puzzle

  belongs_to :puzzle

  private
  def assign_puzzle
    self.puzzle = Puzzle.random
    self.status = 'Active'
    self.progress = self.puzzle.solution.gsub(/[A-Z]/, '*')
    self.key = SecureRandom.uuid.gsub(/\-/,'')
  end
end

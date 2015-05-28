class Game < ActiveRecord::Base
  before_create :assign_puzzle

  belongs_to :puzzle


  def make_guess(letter)
    self.reveal = self.reveal + letter.upcase
    self.progress = self.puzzle.solution
    ("A".."Z").to_a.join.delete(self.reveal).split('').each do |l|
      self.progress.gsub!(l, '*')
    end
    if self.progress == self.puzzle.solution
      self.status = 'Solved'
    end
    self.save
  end

  private
  def assign_puzzle
    self.puzzle = Puzzle.random
    self.status = 'Active'
    self.progress = self.puzzle.solution.gsub(/[A-Z]/, '*')
    self.key = SecureRandom.uuid.gsub(/\-/,'')
  end
end

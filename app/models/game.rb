class Game < ActiveRecord::Base
  before_create :assign_puzzle

  belongs_to :puzzle


  def make_guess(letter)
    reveal = reveal + letter.upcase
    progress = puzzle.solution
    ("A".."Z").to_a.join.delete(reveal).split('').each do |l|
      progress.gsub!(l, '*')
    end
    if progress == puzzle.solution
      status = 'Solved'
    end
    save
  end

  private
  def assign_puzzle
    puzzle = Puzzle.random
    status = 'Active'
    progress = puzzle.solution.gsub(/[A-Z]/, '*')
    key = SecureRandom.uuid.gsub(/\-/,'')
  end
end

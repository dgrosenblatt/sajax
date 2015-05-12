class Puzzle < ActiveRecord::Base
  validates :solution,
    presence: true

  validates :category,
    presence: true

  validates :date,
    presence: true
end

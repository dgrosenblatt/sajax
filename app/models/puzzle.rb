class Puzzle < ActiveRecord::Base
  has_many :games

  validates :solution,
    presence: true

  validates :category,
    presence: true

  validates :date,
    presence: true
end

class Puzzle < ActiveRecord::Base
  has_many :games

  validates :solution,
    presence: true

  validates :category,
    presence: true

  validates :date,
    presence: true

  def self.random
    limit(1).offset(rand(count)).first
  end
end

require 'rails_helper'

RSpec.describe Puzzle, :type => :model do
  puzzle = FactoryGirl.create(:puzzle)
  subject { puzzle }

  it { should respond_to(:solution) }
  it { should respond_to(:category) }
  it { should respond_to(:date) }
end

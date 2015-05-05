module Api
  class PuzzlesController < ApplicationController
    def index
      puzzles = Puzzle.all
      if category = params[:category]
        puzzles = puzzles.where("lower(category) = ?", category.downcase)
      end
      render json: puzzles, status: 200
    end

    def show
      puzzle = Puzzle.find(params[:id])
      render json: puzzle, status: 200
    end
  end
end

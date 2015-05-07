module Api
  class PuzzlesController < ApplicationController
    def index
      puzzles = Puzzle.all
      if category = params[:category]
        puzzles = puzzles.where("lower(category) = ?", category.downcase)
      end
      respond_to do |format|
        format.json { render json: puzzles, status: 200 }
        format.xml  { render xml: puzzles, status: 200 }
      end
    end

    def show
      puzzle = Puzzle.find(params[:id])
      render json: puzzle, status: 200
    end
  end
end

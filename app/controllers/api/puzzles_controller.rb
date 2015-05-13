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
      respond_to do |format|
        format.json { render json: puzzle, status: 200 }
        format.xml  { render xml: puzzle, status: 200 }
      end
    end

    def create
      puzzle = Puzzle.new(puzzle_params)
      if puzzle.save
        render json: puzzle, status: 201, location: api_puzzle_path(puzzle)
      else
        head 422
      end
    end

    def update
      puzzle = Puzzle.find(params[:id])
      if puzzle.update(puzzle_params)
        render json: puzzle, status: 200
      else
        head 422
      end
    end

    def destroy
      puzzle = Puzzle.find(params[:id])
      puzzle.destroy
      head 204
    end

    private
    def puzzle_params
      params.require(:puzzle).permit(:solution, :category, :date)
    end
  end
end

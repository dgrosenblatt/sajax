module Api
  module V1
    class GamesController < ApplicationController
      def create
        game = Game.create
        render json: game, status: :created
      end

      def update
        game = Game.find(params[:id])
        if params[:key] != game.key
          head 401
        end
        game.make_guess(params[:guess])
        render json: game
      end
    end
  end
end

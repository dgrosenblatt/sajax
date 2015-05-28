module Api
  module V1
    class GamesController < ApplicationController
      def create
        game = Game.create
        render json: game, status: 201
      end

      def update
        game = Game.find(params[:id])
        if params[:key] != game.key
          head 401
        end
        game.make_guess(params[:guess])
        render json: game, status: 200
      end
    end
  end
end

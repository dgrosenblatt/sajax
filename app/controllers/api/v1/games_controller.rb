module Api
  module V1
    class GamesController < ApplicationController
      def create
        game = Game.create
        render json: game, status: 201
      end
    end
  end
end

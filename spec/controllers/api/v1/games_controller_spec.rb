require 'rails_helper'

describe Api::V1::GamesController do
  before(:each) do
    @request.host = 'api.example.com'
    FactoryGirl.create(:puzzle)
  end

  describe 'POST #create' do
    it 'creates a new game' do
      game_total = Game.count
      post :create
      game_response = JSON.parse(response.body, symbolize_names: true)
      expect(Game.count).to eq game_total + 1
      expect(game_response[:game][:progress][0]).to eq '*'
    end
  end

  describe 'PATCH #update' do
    it 'updates a game with a valid correct guess' do
      game = FactoryGirl.create(:game)
      patch :update, id: game.id, key: game.key, guess: 'P'
      game_response = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq 200
      expect(game_response[:game][:progress][0]).to eq 'P'
      expect(game_response[:game][:progress].last).to eq '*'
    end
  end
end

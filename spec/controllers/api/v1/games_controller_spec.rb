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
end

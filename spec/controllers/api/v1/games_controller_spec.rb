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
      expect(Game.count).to eq game_total + 1
    end
  end
end

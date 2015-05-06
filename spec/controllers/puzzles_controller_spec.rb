require 'rails_helper'

describe Api::PuzzlesController do
  before(:each) do
    @request.host = "api.example.com"
  end

  describe "GET #index" do
    it "returns information about puzzles" do
      puzzles = FactoryGirl.create_list(:puzzle, 5)
      get :index
      puzzle_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_success
      expect(puzzle_response[:puzzles].length).to eq 5
    end
  end
end

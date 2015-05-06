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

  describe "GET #show" do
    it "returns information about a puzzle" do
      puzzle = FactoryGirl.create(:puzzle)
      get :show, id: puzzle.id
      puzzle_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_success
      expect(puzzle_response[:puzzle][:solution]).to eq puzzle.solution
      expect(puzzle_response[:puzzle][:category]).to eq puzzle.category
    end
  end
end

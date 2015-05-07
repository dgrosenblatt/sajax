require 'rails_helper'
require 'pry'

describe Api::PuzzlesController do
  before(:each) { @request.host = "api.example.com" }

  describe "GET #index" do
    before { FactoryGirl.create_list(:puzzle, 5) }

    it "renders JSON representation of puzzles" do
      @request.headers['Accept'] = "application/json"
      get :index
      puzzle_response = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
      expect(puzzle_response[:puzzles].length).to eq 5
    end

    it "renders XML representation of puzzles" do
      @request.headers['Accept'] = "application/xml"
      get :index
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/xml"
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

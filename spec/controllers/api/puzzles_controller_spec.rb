require 'rails_helper'

describe Api::PuzzlesController do
  before(:each) { @request.host = 'api.example.com' }

  describe 'GET #index' do
    before { FactoryGirl.create_list(:puzzle, 5) }

    it 'renders JSON representation of puzzles' do
      @request.headers['Accept'] = Mime::JSON
      get :index
      puzzle_response = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq 200
      expect(response.content_type).to eq Mime::JSON.to_s
      expect(puzzle_response[:puzzles].length).to eq 5
    end

    it 'renders XML representation of puzzles' do
      @request.headers['Accept'] = Mime::XML
      get :index
      expect(response.status).to eq 200
      expect(response.content_type).to eq Mime::XML.to_s
    end
  end

  describe 'GET #show' do
    it 'renders JSON representation of a puzzle' do
      puzzle = FactoryGirl.create(:puzzle)
      @request.headers['Accept']  = Mime::JSON
      get :show, id: puzzle.id
      puzzle_response = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq 200
      expect(puzzle_response[:puzzle][:solution]).to eq puzzle.solution
      expect(puzzle_response[:puzzle][:category]).to eq puzzle.category
      expect(response.content_type).to eq Mime::JSON.to_s
    end

    it 'renders XML representation of a puzzle' do
      puzzle = FactoryGirl.create(:puzzle)
      @request.headers['Accept']  = Mime::XML
      get :show, id: puzzle.id
      expect(response.status).to eq 200
      expect(response.content_type).to eq Mime::XML.to_s
    end
  end

  describe 'POST #create' do
    it 'creates a new puzzle from submission of valid info' do
      puzzle = FactoryGirl.build(:puzzle)
      puzzle_total = Puzzle.count
      post :create, format: :json,
        puzzle: { solution: puzzle.solution, category: puzzle.category, date: puzzle.date}
      expect(response.status).to eq 201
      expect(response.content_type).to eq Mime::JSON.to_s
      expect(Puzzle.count).to eq puzzle_total + 1
    end

    it "responds with 422 upon submission without required info" do
      puzzle = FactoryGirl.build(:puzzle)
      puzzle_total = Puzzle.count
      post :create, format: :json,
        puzzle: { solution: nil }
      expect(response.status).to eq 422
      expect(Puzzle.count).to eq puzzle_total
    end
  end
end

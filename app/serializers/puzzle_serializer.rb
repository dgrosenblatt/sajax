class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :solution, :category, :date
end

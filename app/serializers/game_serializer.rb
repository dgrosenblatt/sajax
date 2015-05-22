class GameSerializer < ActiveModel::Serializer
  attributes :id, :status, :progress, :key
  belongs_to :puzzle_id
end

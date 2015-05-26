class GameSerializer < ActiveModel::Serializer
  attributes :id, :status, :progress, :key, :category

  def category
    object.puzzle.category
  end
end

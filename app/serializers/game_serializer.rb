class GameSerializer < ActiveModel::Serializer
  attributes :id, :status, :progress, :key, :category
end

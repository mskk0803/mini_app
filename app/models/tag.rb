class Tag < ApplicationRecord
  validates :name,presence: true, uniqueness: trure
  has_many :game_tags, dependent: :destroy
  has_many :game, through: :game_tags
end

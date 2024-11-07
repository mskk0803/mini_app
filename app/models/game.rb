class Game < ApplicationRecord
  validates :title, presence: true
  has_rich_text :content
  has_many :game_tags, dependent: :destroy
  has_many:tags, through: :game_tags
end

class Comment < ApplicationRecord
  belongs_to :game
  validates :comment, presence: true
end

class Comment < ApplicationRecord
  belons_to :game
  validates :comment, presence: true
end

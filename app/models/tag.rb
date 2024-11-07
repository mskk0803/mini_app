class Tag < ApplicationRecord
  validates :name,presence: true, uniqueness: trure

end

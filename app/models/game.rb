class Game < ApplicationRecord
  validates :title, presence: true
  has_rich_text :content
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags

  def save_tag(tag_name)
    tag_array = tag_name.split(",").uniq
    old_tags = self.tags.map{|t| t.name}
    new_tags = tag_array - old_tags

    new_tags.each do |t|
      tag = Tag.find_or_initialize_by(name: t)
      self.tags << tag
    end
  end
end

class Game < ApplicationRecord
  validates :title, presence: true
  has_rich_text :content
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags
  has_many :comment, dependent: :destroy

  def save_tag(tag_json)
    binding.pry
    json_array = JSON.parse(tag_json).map do |j|
      j.values[0]
    end
    tag_array = json_array.uniq
    # 古いtagの削除
    old_relations = GameTag.where(game_id: self.id)
    old_relations.each do |r|
      r.delete
    end

    tag_array.each do |t|
      tag = Tag.find_or_initialize_by(name: t)
      self.tags << tag
    end
  end
end

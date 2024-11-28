class Game < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :min, allow_blank: true, numericality: { only_integer: true }
  validates :max, allow_blank: true, numericality: { only_integer: true }
  validates :time, allow_blank: true, numericality: { only_integer: true }
  # asociations
  has_rich_text :content
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags
  # has_many :comment, dependent: :destroy

  # ransackのホワイトリスト
  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  def save_tag(tag_json)
    if !tag_json.empty?
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
end

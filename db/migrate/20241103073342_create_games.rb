class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :min
      t.integer :max
      t.integer :time
      t.integer :dificullty
      t.integer :space

      t.timestamps
    end
  end
end

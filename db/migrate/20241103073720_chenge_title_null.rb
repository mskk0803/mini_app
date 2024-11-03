class ChengeTitleNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :games, :title, false
  end
end

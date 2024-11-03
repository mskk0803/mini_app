class RenameUserNameColumnToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_name, :email
  end
end

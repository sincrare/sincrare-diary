class AddAccessLevelToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :access_level, :integer, default: 0, null: false
  end
end

class AddIndexToArticlesEntryAt < ActiveRecord::Migration[5.2]
  def change
    add_index :articles, :entry_at
  end
end

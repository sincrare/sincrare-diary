class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.datetime :entry_at
      t.string :title
      t.text :content
      t.boolean :published, default: true, null: false

      t.timestamps
    end
  end
end

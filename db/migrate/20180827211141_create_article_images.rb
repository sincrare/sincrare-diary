class CreateArticleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :article_images do |t|
      t.bigint :article_id, index: true, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end

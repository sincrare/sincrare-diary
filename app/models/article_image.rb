class ArticleImage < ApplicationRecord
  validates :image, presence: true
  belongs_to :article, optional: true
  mount_uploader :image, ImageUploader

  scope :unlinked_images, -> { where(article_id: nil) }

  # 画像は記事の登録前にアップロードされている。article_idがnullの記事を紐付ける処理
  # 代替案としては、アップロードした画像のidを画面のhiddenに埋め込んでおくとか・・・？
  def self.link_uploaded_images(article_id)
    ArticleImage.unlinked_images.update_all(article_id: article_id)
  end
end

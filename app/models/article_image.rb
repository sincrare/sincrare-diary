class ArticleImage < ApplicationRecord
  validates :image, presence: true
  belongs_to :article, optional: true
  mount_uploader :image, ImageUploader

  scope :unlinked_images, -> { where(article_id: nil) }

  def self.link_uploaded_images(article_id)
    ArticleImage.unlinked_images.update_all(article_id: article_id)
  end
end

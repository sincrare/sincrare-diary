class ArticleImage < ApplicationRecord
  validates :image, presence: true
  belongs_to :article
  mount_uploader :image, ImageUploader
end

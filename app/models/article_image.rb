class ArticleImage < ApplicationRecord
  belongs_to :article
  mount_uploader :image, ImageUploader
end

class Article < ApplicationRecord
  paginates_per 10
  validates :entry_at, presence: true
  validates :title, presence: true

  has_many :article_images
  accepts_nested_attributes_for :article_images

  enum access_level: { normal: 0, friend: 1, family: 2 }

  scope :order_desc, -> { order(entry_at: :desc) }
  scope :published, -> { where(published: true) }
  scope :accessable, -> (user) { where("access_level <= ?", user.nil? ? 0 : user.access_level_before_type_cast) }

  def default_images_build
    article_image_count = 10
    (article_image_count - article_images.count).times { article_images.build }
  end
end

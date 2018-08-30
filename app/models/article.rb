class Article < ApplicationRecord
  extend Enumerize
  paginates_per 10
  validates :entry_at, presence: true
  validates :title, presence: true

  has_many :article_images, dependent: :destroy
  accepts_nested_attributes_for :article_images, allow_destroy: true

  enumerize :access_level, in: { normal: 0, friend: 1, family: 2 }

  scope :order_desc, -> { order(entry_at: :desc) }
  scope :published, -> { where(published: true) }
  scope :accessible, -> (user) { where("access_level <= ?", user.nil? ? 0 : user.access_level_before_type_cast) }
end

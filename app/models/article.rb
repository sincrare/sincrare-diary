class Article < ApplicationRecord
  paginates_per 10
  validates :entry_at, presence: true
  validates :title, presence: true

  scope :order_desc, -> { order(entry_at: :desc) }
  scope :published, -> { where(published: true) }
end

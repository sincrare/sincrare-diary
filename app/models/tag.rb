class Tag < ApplicationRecord
  validates :name, presence: true

  scope :default_order, -> { order(id: :asc) }

  has_many :article_tag, dependent: :destroy
end

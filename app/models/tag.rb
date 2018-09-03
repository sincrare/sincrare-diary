class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :article_tag, dependent: :destroy
end

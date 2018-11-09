class Comment < ApplicationRecord
  validates :name, presence: true

  scope :default_order, -> { order(created_at: :asc) }

  belongs_to :article
  belongs_to :user
end

class Comment < ApplicationRecord
  validates :name, presence: true

  belongs_to :article
  belongs_to :user
end

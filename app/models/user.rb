class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  extend Enumerize
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enumerize :access_level, in: { normal: 1, friend: 2, family: 3 }
end

class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enumerize :access_level, in: { normal: 0, friend: 1, family: 2 }, scope: :having_status
end

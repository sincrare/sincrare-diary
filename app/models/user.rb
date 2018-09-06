class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enumerize :access_level, in: { normal: 1, friend: 2, family: 3 }
end

class User < ApplicationRecord
  has_one_attached :image

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true
end

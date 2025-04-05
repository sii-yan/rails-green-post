class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments

  has_one_attached :image

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true
end

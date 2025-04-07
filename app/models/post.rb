class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


  has_one_attached :image

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
end

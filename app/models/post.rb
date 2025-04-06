class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content
    validates :image
  end
end

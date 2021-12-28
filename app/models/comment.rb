class Comment < ApplicationRecord
	belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  validates :user_id, :title, :post_id, presence: true
end

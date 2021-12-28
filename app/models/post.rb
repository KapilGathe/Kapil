class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
  belongs_to :user
  validates :user_id, :title, presence: true
end

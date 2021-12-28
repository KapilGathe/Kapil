class User < ApplicationRecord
	has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence:true


  def self.posts_report_with_count_of_posts
    users_with_posts = User.joins(:posts).group("user_id").count
    arr = []
    users_with_posts.each {|k,v| arr.push({user_id: k,number_of_posts: v})}
    arr
  end 
end

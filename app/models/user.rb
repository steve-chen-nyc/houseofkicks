class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :posts
  has_many :comments, through: :posts

  def add_post(post)
    self.posts.push(post)
  end

end

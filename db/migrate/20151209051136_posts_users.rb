class PostsUsers < ActiveRecord::Migration
  def change
     create_join_table :users, :posts
  end
end

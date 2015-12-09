class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    current_user.add_post(@post)

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])

    @comment = Comment.new
    @comment.post_id = @post.id

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.present?
      @post.destroy
      redirect_to posts_path
    else
    redirect_to posts_path(@post)
    end
  end


  private
  def post_params
    params.require(:post).permit(:image, :caption, :release_date)
  end

end

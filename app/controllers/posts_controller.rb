class PostsController < ApplicationController
 before_action :find_user, only: [:create]
 before_action :find_post, except: [:create, :index]
 
  def create
 	  @post = @user.posts.new(post_params)
 	  if @post.save
      render json: {message: "Post created successfully"}, status: 201
    else
   	  render json: {message: @post.errors.full_messages}, status: 422  
    end
  end

  def index
    @posts = Post.all
    render json: {posts: @posts}, status: 200
  end

  def update
    if @post.update(post_params)
      render json: {message: "Post updated successfully"}, status: 200
    else
      render json: {message: @post.errors.full_messages}, status: 422
    end
  end

  def show
    render json: {post: @post}, status: 200
  end

  def destroy
    if @post.destroy
      render json: {message: "Post deleted successfully"}, status: 200
    else
      render json: {message: @post.errors.full_messages}, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title)		
  end
  
  def find_user
    @user = User.find params[:post][:user_id]
  end

  def find_post
 	  @post = Post.find params[:id]
  end
end

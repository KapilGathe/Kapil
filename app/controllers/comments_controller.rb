class CommentsController < ApplicationController
	before_action :find_user, only: [:create]
  before_action :find_comment, except: [:create, :index]
  def create
    @comment = @user.comments.new(comment_params)
    if @comment.save
      render json: {message: "Comment created successfully"}, status: 201
    else
      render json: {message: @comment.errors.full_messages}, status: 422  
    end
  end

  def index
    @comments = Comment.all
    render json: {comments: @comments}, status: 200
  end

  def update
    if @comment.update(comment_params)
      render json: {message: "comment updated successfully"}, status: 200
    else
      render json: {message: @comment.errors.full_messages}, status: 422
    end
  end

  def show
    render json: {comment: @comment}, status: 200
  end

  def destroy
    if @comment.destroy
      render json: {message: "comment deleted successfully"}, status: 200
    else
      render json: {message: @comment.errors.full_messages}, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :user_id)   
  end
 
  def find_comment
    @comment = Comment.find params[:id]
  end

  def find_user
    @user = User.find params[:comment][:user_id]
  end
end

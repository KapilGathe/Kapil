class LikesController < ApplicationController
 before_action :find_user, only: [:create]
 before_action :find_like, except: [:create, :index]
 def create
   @like = @user.likes.new(like_params) 	
   if @like.save
     render json: {message: "like created successfully"}, status: 201
   else 
   	 render json: {message: @like.errors.full_messages}, status: 422  
   end
 end
 
  # def index
  #   @likes = Like.all
  #   render json: {likes: @likes}, status: 200
  # end

  # def show
  #   render json: {like: @like}, status: 200
  # end

  def destroy
    if @like.destroy
      render json: {message: "like deleted successfully"}, status: 200
    else
      render json: {message: @like.errors.full_messages}, status: 422
    end
  end
 
  private
 
  def find_user
    @user = User.find params[:like][:user_id]
  end

  # def find_like
  #   @like = Like.find(params[:id])
  # end

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end

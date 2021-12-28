class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy, :update]
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {message: "User created successfully"}, status: 201
    else
     	render json: {message: @user.errors.full_messages}, status: 422  
    end 
  end

  def index
    @users = User.all
    render json: {users: @users}
  end

  def update
    if @user.update(user_params)
      render json: {message: "User updated successfully"}, status: 200
    else
      render json: {message: @user.errors.full_messages}, status: 422
    end
  end

  def show
    render json: {user: @user}, status: 200
  end

  def destroy
    if @user.destroy
      render json: {message: "User deleted successfully"}, status: 200
    else
      render json: {message: @user.errors.full_messages}, status: 422
    end
  end

  private

  def find_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name)
  end   
end

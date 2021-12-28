require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  describe "Like API", type: :controller do
    before(:each) do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user_id: @user.id)
      @comment = FactoryBot.create(:comment, user_id: @user.id, post_id: @post.id)
    end
    context "should create like on post" do
      it "should create like" do  
        post :create , params: {like: {user_id: @user.id, likeable_id: @post.id, likeable_type: "Post"}}, format: :json    
        expect(response.status).to eq 201
      end
      it "should create like on comment" do
        post :create , params: {like: {user_id: @user.id, likeable_id: @comment.id, likeable_type: "Comment"}}, format: :json    
        expect(response.status).to eq 201
      end
      it "should give an error on post by same user" do
        post :create , params: {like: {user_id: @user.id, likeable_id: @post.id, likeable_type: "Post"}}, format: :json    
        post :create , params: {like: {user_id: @user.id, likeable_id: @post.id, likeable_type: "Post"}}, format: :json    
        expect(response.status).to eq 422
      end
      it "should give an error on comment by same user" do
        post :create , params: {like: {user_id: @user.id, likeable_id: @comment.id, likeable_type: "Comment"}}, format: :json    
        post :create , params: {like: {user_id: @user.id, likeable_id: @comment.id, likeable_type: "Comment"}}, format: :json    
        expect(response.status).to eq 422
      end
    end
  end
end
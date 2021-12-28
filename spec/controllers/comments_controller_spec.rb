require 'rails_helper'
RSpec.describe CommentsController, type: :controller do
  describe "Comments API", type: :controller do
    before(:each) do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user_id: user.id)
      FactoryBot.create(:comment, user_id: user.id, post_id: post.id)
      FactoryBot.create(:comment, user_id: user.id, post_id: post.id)
    end
    it "return all comments" do
      get :index
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["comments"].size).to eq 2
    end   
  end
end
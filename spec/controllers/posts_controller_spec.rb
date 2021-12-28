require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  describe "Posts API", type: :controller do
    before(:each) do
      user = FactoryBot.create(:user)
      FactoryBot.create(:post, user_id: user.id)
      FactoryBot.create(:post, user_id: user.id)
    end
    it "return all posts" do
      get :index
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["posts"].size).to eq 2
    end	  
  end
end
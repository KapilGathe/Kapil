require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe "Users API", type: :controller do
    before(:each) do
      FactoryBot.create(:user)
      FactoryBot.create(:user)
    end
    it "return all users" do
      get :index
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["users"].size).to eq 2
    end	  
  end
end
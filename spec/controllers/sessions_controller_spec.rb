require 'rails_helper'
require 'user_management'
RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST CREATE" do
    it 'creates new session' do
      Bridge::UserManagement.any_instance.stub(:login).and_return({body: {session: "asdf"}})
      expect {
        post :create, {email: 'test@test.com', password: "qwer1234"}
      }.to
    end

  end

end

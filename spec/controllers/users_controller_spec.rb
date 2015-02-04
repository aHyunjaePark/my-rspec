require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end


  describe "POST CREATE" do
    let(:success_params) { {name: "a", email: "a@a.com", password: "qwer1234", password_confirmation: "qwer1234"} }
    let(:fail_params) {{name: "a", email: "a@a.com", password: "qwer1234", password_confirmation: "qwer123412313"}}
    it 'adds new user' do
      expect {
        post :create, {user: success_params}
      }.to change(User, :count).by(1)
      # post :create, {user: success_params}
      # it { is_expected.to change { User.count }.by(1) }
    end
    it 'haveto fail with fail params' do
      expect {
        post :create, {user: fail_params}
      }.to change(User, :count).by(0)
    end
  end

end

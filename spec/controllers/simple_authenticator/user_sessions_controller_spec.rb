require 'spec_helper'

describe SimpleAuthenticator::UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get :new, use_route: :simple_authenticator
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do

    let(:create_action) do
      post :create,
        email: "test@example.com",
        password: "foobarbaz",
        use_route: :simple_authenticator
    end

    before(:each) do
    end
    it "set session id" do
      create_action
      expect(session[:user_id]).to eq(user.id)
    end

    it "should redirect to users path" do
      create_action
      expect(response).to redirect_to user_path(user)
    end
  end
end

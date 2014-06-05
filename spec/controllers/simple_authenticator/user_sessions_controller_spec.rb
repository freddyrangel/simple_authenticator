require 'spec_helper'

describe SimpleAuthenticator::UserSessionsController do

  routes { SimpleAuthenticator::Engine.routes }

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do

    let!(:user) { create(:user) }

    let(:create_action) do
      post :create,
        email: user.email,
        password: user.password
    end

    context 'with valid params' do

      before(:each) { create_action }

      it "set session id" do
        expect(session[:user_id]).to eq(user.id)
      end

      it "should redirect to users path" do
        expect(response).to redirect_to "/"
      end
    end

    context 'with invalid params' do

      before(:each) do
        User.any_instance.stub(:authenticate).and_return(false)
        create_action
      end

      it "should not set session" do
        expect(session[:user_id]).to be_nil
      end

      it "should render new" do
        expect(response).to render_template 'new'
      end
    end
  end

  describe "#destroy" do

    let!(:user) { create(:user) }

    let(:destroy_action) do
      delete :destroy,
        id: user.id
    end

    before(:each) do
      login(user)
      destroy_action
    end

    it "should reset the session" do
      expect(session[:user_id]).to be_nil
    end

    it "should redirect to root path" do
      expect(response).to redirect_to "/"
    end
  end
end

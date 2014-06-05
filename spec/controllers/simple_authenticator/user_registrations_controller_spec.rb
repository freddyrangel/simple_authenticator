require 'spec_helper'

describe SimpleAuthenticator::UserRegistrationsController do

  routes { SimpleAuthenticator::Engine.routes }

  describe "#new" do

    let(:new_action) { get :new }

    before(:each) { new_action }

    it "should assign a new user" do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "#create" do

    let(:user) { build(:user) }

    let(:create_action) do
      post :create,
        user: {
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation
        }
    end

    it "should create a new user" do
      expect { create_action }.to change(User, :count).by(1)
    end

    it "should redirect to root" do
      create_action
      expect(response).to redirect_to "/"
    end

    context 'with invalid params' do

      before(:each) do
        User.any_instance.stub(:valid?).and_return(false)
      end

      it "should not create a new user" do
        expect { create_action }.to change(User, :count).by(0)
      end

      it "should render new" do
        create_action
        expect(response).to render_template "new"
      end
    end
  end
end

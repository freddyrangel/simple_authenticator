require 'spec_helper'

describe "User Sessions" do

  routes { SimpleAuthenticator::Engine.routes }

  describe 'routing' do

    it 'routes to new' do
      expect(get("/user_sessions/new")).to route_to("simple_authenticator/user_sessions#new")
    end

    it 'routes to create' do
      expect(post("/user_sessions")).to route_to("simple_authenticator/user_sessions#create")
    end

    it 'routes to destroy' do
      expect(delete("/user_sessions/1")).to route_to("simple_authenticator/user_sessions#destroy", "id" => "1")
    end
  end
end

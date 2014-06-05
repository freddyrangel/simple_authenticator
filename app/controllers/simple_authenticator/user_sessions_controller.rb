module SimpleAuthenticator
  class UserSessionsController < ApplicationController
    skip_before_filter :verify_authenticity_token, only: :destroy
    
    def new
    end

    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to main_app.root_path
      else
        render "new"
      end
    end

    def destroy
      #user = User.find(session[:user_id])
      session.delete(:user_id)
      redirect_to main_app.root_path
    end

    private
  end
end

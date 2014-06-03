module SimpleAuthenticator
  class UserSessionsController < ApplicationController
    def new
    end

    def create
      user = get_user
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      end
    end

    private

    def get_user
      User.find_by_email(params[:email])
    end
  end

  private
  def get_user
    User.find(params[:id])
  end
end

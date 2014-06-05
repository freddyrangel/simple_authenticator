module SimpleAuthenticator
  class UserRegistrationsController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_registration_params)

      if @user.save
        redirect_to main_app.root_path
      else
        render :new
      end
    end

    private

    def user_registration_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end

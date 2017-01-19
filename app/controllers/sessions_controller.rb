class SessionsController < ApplicationController
  def create
      user = User.find_by_credentials(
        params[:user][:email],
        params[:user][:password]
      )

      if user.nil?
        flash.now[:errors] = ["Incorrect email and/or password"]
        render json: "Credentials were wrong"
      else
        login_user!(user)
        render json: "Welcome back #{user.username}!"
      end
    end

    def destroy
      logout_user!
      redirect_to new_session_url
    end

    def new
      render :new
    end


end

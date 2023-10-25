class Api::V0::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id

      render json: @user
    else
      render json: {
        error: "Invalid Credentials" 
      }
    end
  end

  def get_current_user
    if logged_in? 
      render json: current_user
    else
      render json: {
        error: "No login"
      }
    end
  end

  def destroy
    if !!session[:user_id]
      session.delete(:user_id)
    else
      render json: {
        error: "User was not logged in"
      }
    end
  end
end
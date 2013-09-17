class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    unless params[:reset_token]
      user = User.find_by_credentials(params[:user][:email], params[:user][:password])
      self.current_user = user

      render text: "logged in"
    #redirect_to user_home

    else
      user = User.find_by_email(params[:user][:email])
      self.current_user = user
      self.current_user.reset_token = nil
      self.save!
      render text: "go to edit page"

    end

  end

  def destroy
    current_user.reset_token!
    session[:session_token] = nil

    render text: "logged out"
  end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create!(params[:user])

    render text: "Created"
    # redirect_to
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    @user = User.find(params[:id])
    render :update
  end

  def reset_form
    render :reset_form
  end

  def initialize_reset
    @email = params[:user][:email]

    user = User.find_by_email(@email)
    user.reset_token = SecureRandom::urlsafe_base64(10)
    user.save!

    UserMailer.password_reset_email(user).deliver!
    render text: "Check your email to reset your password"
  end

  def reset
    email = params[:email]
    user = User.find_by_email(email)
    p params[:reset_token]
    p user.reset_token
    if user && user.reset_token == params[:reset_token]
      #redirect_to session_url
      self.current_user = user
      redirect_to user_url(user.id)
    else
      render text: 'invalid email or token'
    end


  end
end

class CirclesController < ApplicationController


  def new
    @users = User.all
  end

  def create

    circle = Circle.new(params[:circle])
    circle.owner_id = current_user.id
    circle.save


    redirect_to circle_url(circle)
  end

  def show
    @circle = Circle.includes(:members).find(params[:id])
    render :show
  end

  def edit
    @circle = Circle.includes(:members).find(params[:id])
    @users = User.all
    render :edit
  end

  def update
    @circle = Circle.find(params[:id])
    @circle.update_attributes(params[:circle])
    redirect_to @circle
  end





end

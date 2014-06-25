class UsersController < ApplicationController
 
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end
  
  def index
    render json: User.all
  end
  
  def new
    create
  end
  
  def show
    render json: User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      show
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  private
  def user_params
    params[:user].permit(:username)
  end
end

class UsersController < ApplicationController
  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      # render :json => "whatever"
      render :json => user.errors.full_messages, :status => :unprocessable_entity
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: User.all
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
    user.update!(params[:user].permit(:name, :email))
    show
  end

end

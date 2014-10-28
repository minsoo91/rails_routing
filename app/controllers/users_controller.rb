class UsersController < ApplicationController
  
  def index
    # hello = "hello, my name is minsoo".to_json
    render json: User.all
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end
  
  def show
    user = User.find(params[:id])
    
    render json: user
  end
  
  def update
    user = User.find(params[:id])
    user.update!(user_params)
    
    render json: user
  end
  
  def destroy
    user = User.find(params[:id])
    user.delete
    
    render json: user
  end
  
  protected
  
  def user_params
    params[:user].permit(:username)
  end
end

class UsersController < ApplicationController
  def auth
    user = User.find_by(username: auth_params[:username])
    return head :unauthorized unless user && user.authenticate(auth_params[:password])
    json_response(token: auth_create(user))
  end

  def index
    @users = User.all
    json_response(@users)
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  def user_params
    params.permit(:first_name, :last_name, :address_line_1, :dob, :username, :password)
  end

  def auth_params
    params.permit(:username, :password)
  end
end

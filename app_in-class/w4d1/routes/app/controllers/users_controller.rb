
class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render json: @user
    else
      redirect_to user_url
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    render :edit
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.delete
    end
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end

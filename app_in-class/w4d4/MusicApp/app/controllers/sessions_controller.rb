class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(sess_params[:email], sess_params[:password])

    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    log_out
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def sess_params
    params.require(:user).permit(:email, :password)
  end


end

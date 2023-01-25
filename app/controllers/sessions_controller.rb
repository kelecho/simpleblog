class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      flash.now.alert = 'Email or password is invalid'
      render :new
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: 'Logged in.'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  # DELETE /sessions/:id
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged out!'
  end

end

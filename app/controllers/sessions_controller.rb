class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully!!!"
      redirect_to user
    else
      flash.now[:alert] = "Username and Password do not match!!!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "A p p   S A D."
    redirect_to root_path
  end

end
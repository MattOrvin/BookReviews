class SessionsController < ApplicationController
  
  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ["invalid credentials"]
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_user_path
  end
end
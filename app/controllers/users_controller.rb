class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
  
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @errors = @user.errors.full_messages
        render :new
      end
    end

    private

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :password_digest)
    end

end

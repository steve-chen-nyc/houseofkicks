class UsersController < ApplicationController

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
          redirect_to '/posts', notice: 'Account created'
        else
          redirect_to "/signup"
        end
      end

    def add_post
      @user = User.find(params[:id])
      @user.add_post(post)
    end

      private
      def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

end

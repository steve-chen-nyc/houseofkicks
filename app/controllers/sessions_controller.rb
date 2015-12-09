class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(posts_path, notice: 'logged in')
      puts('login successful')
    else
        puts('login in failed')
        redirect_to "/posts"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end



end

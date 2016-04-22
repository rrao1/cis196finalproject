# Controller for Sessions
class SessionsController < ApplicationController
  # def new
  #   erb :'sessions/new'
  # end

  def create
    @user = User.find_by(name: params[:name])
    if @user.nil?
      redirect_to '/login'
    elsif @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end

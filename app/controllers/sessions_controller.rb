class SessionsController < ApplicationController

  def new
    
  end

  def create

    @player = Player.find_by(name: params[:name])
    if @player && @player.authenticate(params[:password])
      session[:player_id] = @player.id
      flash[:success] = "Successfully logged in"
      redirect_to '/'
    else
      flash[:warning] = "Invalid name or password"
      redirect_to '/login'
    end
    
  end

  def destroy
    session[:player_id] = nil
    flash[:success] = "Logged out"
    redirect_to '/login'
  end

  
end

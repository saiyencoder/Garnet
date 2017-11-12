class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def current_player
    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end

  helper_method :current_player

  def authenticate_commish!
    redirect_to '/' unless current_player && current_player.commissioner
  end
end

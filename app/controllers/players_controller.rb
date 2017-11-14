class PlayersController < ApplicationController
# before_action :authenticate_commish!, except: [:index, :show]
  
  def index
    @players = Player.all
    @games = Game.all
  end

  def new
    @teams = Team.all
    @player= Player.new
  end

  def create
    @player = Player.create(
                            name: params[:name],
                            team_id: params[:team_id],
                            commissioner: params[:commissioner],
                            captain: params[:captain],
                            password: params[:password],
                            password_confirmation: params[:password_confirmation]
                            )
    if @player
      session[:player_id] = @player.id
      flash[:success] = "Successfully created player"
      redirect_to '/'
    else
      flash[:warning] = "Please check information again"
      redirect_to '/players/new'
    end
    
  end

  def show
    @player = Player.find(params[:id])
    @player.averages
  end

  def edit
    @teams = Team.all
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(
                              name: params[:name],
                              team_id: params[:team_id],
                              commissioner: params[:commissioner],
                              captain: params[:captain]
                              )
    if @player.save
      flash[:success] = "Player Successfully Updated"
      redirect_to '/players/#{ @player.id }'
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    flash[:warning] = "Player Has Been Removed"
    redirect_to '/'
  end


end

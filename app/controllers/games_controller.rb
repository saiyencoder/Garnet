class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @season = Season.find(params[:id])
    @teams = Team.all
    @game = Game.new
  end

  def create
    @game = Game.create(
                        season_id: params[:season_id],
                        team_id: params[:team_id],
                        week: params[:week],
                        scorer: params[:scorer]
                          )
    if @game.save
      flash[:success] = "Game Created"
      redirect_to "/games/#{@game.id}"
    else
      flash[:warning] = "Game was not created. Try again."
      redirect_to "/seasons"
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
    @teams = Team.all
  end

  def update
    @game = Game.find(params[:id])
    @game.update(
                  team_id: params[:team_id],
                  week: params[:week],
                  scorer: params[:scorer]
                  )
    flash[:success] = "Game Info Updated"
    redirect_to "/games/#{@game.id}"
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:warning] = "Game has been removed"
    redirect_to "/games"
  end

end

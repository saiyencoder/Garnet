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
    @game = Game.new(game_params)
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

  def edit_stats
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    @game.stats.each do |stat|
      stat.points = (stat.field_goal_made * 2) + (stat.three_point_made * 3) + (stat.free_throws_made)
      stat.field_goal_percentage = ((stat.field_goal_made.to_f) / (stat.field_goal_attempt.to_f)) * 100
      stat.three_point_field_goal_percentage = ((stat.three_point_made.to_f) / (stat.three_point_attempt.to_f)) * 100
      stat.free_throw_percentage = ((stat.free_throws_made.to_f) / (stat.free_throw_attempts.to_f)) * 100
      @game.update(game_params)
    end
                      
    flash[:success] = "Game Info Updated"
    redirect_to "/games/#{@game.id}/edit_stats"
  end


  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:warning] = "Game has been removed"
    redirect_to "/games"
  end


  private

  def game_params
    params.require(:game).permit(:id, :team_id, :week, :scorer, :season_id, stats_attributes: [:id, :player_name, :field_goal_made, :field_goal_attempt, :three_point_made, :three_point_attempt, :free_throws_made, :free_throw_attempts, :rebounds, :assists, :steals, :blocks, :fouls, :points, :field_goal_percentage, :three_point_field_goal_percentage, :free_throw_percentage])
  end

end

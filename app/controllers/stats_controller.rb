class StatsController < ApplicationController
  def index
    @stats = Stat.all
    @games = Game.all
  end

  def new
    @game = Game.find(params[:id])
    @players = @game.team.players
    @stat = Stat.new
  end

  def create
    @stat = Stat.new(
                      game_id: params[:game_id],
                      player_id: params[:player_id],
                      field_goal_made: 0,
                      field_goal_attempt: 0,
                      three_point_made: 0,
                      three_point_attempt: 0,
                      free_throws_made: 0,
                      free_throw_attempts: 0,
                      rebounds: 0,
                      assists: 0,
                      steals: 0,
                      blocks: 0,
                      fouls: 0,
                      points: 0
                      )
    if @stat.save
      flash[:success] = "Stat Successfully Created"
      redirect_to "/stats/#{@stat.id}/edit"
    else
      redirect_to "/games"
    end
  end

  def show
    @stat = Stat.find(params[:id])
    @players = @stat.game.team.players
  end

  def edit
    @stat = Stat.find(params[:id])
    @players = @stat.game.team.players
  end

  def update
    @stat = Stat.find(params[:id])
    @stat.assign_attributes(
                            field_goal_made: params[:field_goal_made],
                            field_goal_attempt: params[:field_goal_attempt],
                            three_point_made: params[:three_point_made],
                            three_point_attempt: params[:three_point_attempt],
                            free_throws_made: params[:free_throws_made],
                            free_throw_attempts: params[:free_throw_attempts],
                            rebounds: params[:rebounds],
                            assists: params[:assists],
                            steals: params[:steals],
                            blocks: params[:blocks],
                            fouls: params[:fouls]
                            )
    @stat.calculate_total
    flash[:success] = "Stats Updated."
    redirect_to "/stats/#{@stat.id}/edit"
  end

  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy
    flash[:success] = "Stats Deleted"
    redirect_to "/stats"
  end
end

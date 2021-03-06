class StatsController < ApplicationController
before_action :authenticate_commish!, except: [:index, :show, :teamstats]


  def index
    @stats = Stat.all
    @games = Game.all
    @players = Player.all
  end

  def new
    @game = Game.find(params[:id])
    @stat = Stat.new
    @players = @game.team.players
  end

  def create
    @game = Game.find(params[:game_id])
    @game.team.players.each do |player|
      Stat.create!(
                    game_id: params[:game_id],
                    player_id: player.id,
                    player_name: player.name,
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
                    points: 0,
                    field_goal_percentage: 0,
                    three_point_field_goal_percentage: 0,
                    free_throw_percentage: 0
                  )
    end

    redirect_to "/games/#{@game.id}/edit_stats"
  end

  def show
    @stat = Stat.find(params[:id])
    @players = @stat.game.team.players
  end

  def edit
    @game = Game.find(params[:game_id])
    @stats = Stat.where(game_id: @game.id)
  end

  def update
    @game = Game.find(params[:game_id])
    @stats = Stat.where(game_id: @game.id)
  end

  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy
    flash[:success] = "Stats Deleted"
    redirect_to "/stats"
  end

  def teamstats
    @game = Game.find(params[:game_id])
    @stats = Stat.where(game_id: @game.id)
  end

  private

  def stat_params
    params.permit(:field_goal_made, :field_goal_attempt, :three_point_made, :three_point_attempt, :free_throws_made, :free_throw_attempts, :rebounds, :assists, :steals, :blocks, :fouls)
  end

end

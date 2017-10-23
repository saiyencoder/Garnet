class StatsController < ApplicationController
  def index
    @stats = Stat.all
    @games = Game.all
  end

  def new
    @game = Game.find(params[:id])
    @players = @game.team.players
    # @teams = Team.all
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
      redirect_to "/"
    end
  end

  def show
    @stat = Stat.find(params[:id])
  end

  def edit
    @stat = Stat.find(params[:id])
    @player = @stat.player_id
  end

  def update
    
  end

  def destroy

  end
end

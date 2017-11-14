class TeamsController < ApplicationController
before_action :authenticate_commish!, except: [:index, :show]
  

  def index
    @teams = Team.all
    @players = Player.all
  end

  def show
    @team = Team.find(params[:id])
    @team.team_averages
  end

  def edit
    @team = Team.find(params[:id])
  end 

  def update
    @team = Team.find(params[:id])
    @team.update(
                  name: params[:name]
                  )
    flash[:success] = "Team Updated"
    redirect_to "/teams/#{@team.id}"
  end

end

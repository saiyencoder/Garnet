class SeasonsController < ApplicationController

  def homepage
    
  end

  def index
    @seasons = Season.all
  end

  def new

  end

  def create
    @season = Season.create(
                            quarter: params[:quarter],
                            year: params[:year]
                            )
    flash[:success] = "Season Created"
    redirect_to "/seasons"
  end

  def show
    @season = Season.find(params[:id])
    @games = Game.where("season_id = ?", @season.id)
  end

  def edit
    @season = Season.find(params[:id])
  end

  def update
    @season = Season.find(params[:id])
    @season.update(
                    quarter: params[:quarter],
                    year: params[:year]
                    )
    flash[:success] = "Season Info Updated"
    redirect_to "/seasons/#{@season.id}"
  end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy
    flash[:success] = "Season Removed"
    redirect_to '/seasons'
  end
end

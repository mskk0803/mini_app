class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      redirect_to games_path
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to games_path
    else
      redirect_to games_path
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy!
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :min, :max, :time, :dificullty, :space, :content)
  end
end

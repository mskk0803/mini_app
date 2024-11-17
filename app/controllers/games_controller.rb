class GamesController < ApplicationController
  require "json"
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @tags = @game.tags.pluck(:name).join(",")
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    tag_json = params[:game][:tag]
    if @game.save
      @game.save_tag(tag_json)
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
    tag_json = params[:game][:tag]
    if @game.update(game_params)
      @game.save_tag(tag_json)
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

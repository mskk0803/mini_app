class GamesController < ApplicationController
  require "json"
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(distinct: true)
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
      flash[:notice] = "投稿しました"
      redirect_to games_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
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
      flash[:notice] = "更新しました"
      redirect_to games_path
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy!
    redirect_to games_path
    flash[:notice] = "削除しました"
  end

  private
  def game_params
    params.require(:game).permit(:title, :min, :max, :time, :dificullty, :space, :content)
  end
end

class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @games = Game.all
  end

  def show
  end
end

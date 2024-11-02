class ArticlesController < ApplicationController
  before_aciton :require_login, only: %i[new, create, edit, update, destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

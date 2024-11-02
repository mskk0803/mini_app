class CommentsController < ApplicationController
  before_aciton :require_login %i[destroy]

  def create
  end

  def destroy
  end
end

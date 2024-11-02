class UsersController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
  end
end

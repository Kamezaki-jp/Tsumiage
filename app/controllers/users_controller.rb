class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
  end

  def update

  end

end

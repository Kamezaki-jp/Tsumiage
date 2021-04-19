class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
    @levelSetting = LevelSetting.find_by(level: @user.level + 1);
    @next_level_exp = (@levelSetting.thresold - @user.experience_point)
    @exp_bar = 50 - @next_level_exp
  end

  def update
  end

end

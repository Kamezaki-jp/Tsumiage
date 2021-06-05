class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc).page(params[:page]).per(5)
    # 次のレベルのレコードを取得
    @levelSetting = LevelSetting.find_by(level: @user.level + 1)
    # レベルアップのための必要経験値数の計算
    @next_level_exp = (@levelSetting.thresold - @user.experience_point)
    # 経験値バーの進捗を計算
    @exp_bar = 100 - @next_level_exp
  end

  def update; end
end

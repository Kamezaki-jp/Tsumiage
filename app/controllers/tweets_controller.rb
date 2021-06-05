class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
    @tweet.tasks.build
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweet_path(@tweet), notice: '投稿しました。'
    else
      render 'new', alert: '必須項目があります'
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @tweet_comment = TweetComment.new
    @task = @tweet.tasks
  end

  def edit
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  def update
    @tweet = Tweet.find(params[:id])
    @user = User.find(@tweet.user_id)

    # editのフォームから受け取ったデータを配列にする
    tmp = []
    tweet_params[:tasks_attributes].each do |k, v|
      tmp[k.to_i] = v if v['task_name'].present?
    end

    if @tweet.update(tweet_params)
      # 配列からnilと空文字を取り除く
      tmp.compact.reject(&:empty?).each do |task|
        @task = Task.find_by(id: task[:id], status: 2)
        level_up if !@task.nil? && @user.level < 100
      end
      redirect_to tweet_path(@tweet), notice: '更新しました。'
    else
      redirect_to edit_tweet_path(@tweet), alert: '必須項目があります'
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to user_path(current_user), alert: '投稿を削除しました。'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, tasks_attributes: %i[id task_name status _destroy])
  end

  # レベルアップの処理
  def level_up
    # 変数に現在のユーザーの経験値を代入
    totalExp = @user.experience_point
    # １タスク１０ｐｔで設定
    totalExp += 10
    @user.experience_point = totalExp
    @user.update(experience_point: totalExp)
    # レベルアップの判定
    levelSetting = LevelSetting.find_by(level: @user.level + 1)

    if levelSetting.thresold <= @user.experience_point
      @user.level = @user.level + 1
      @user.update(level: @user.level)
    end
  end
end

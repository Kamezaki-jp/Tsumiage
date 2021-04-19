class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
    @tweet.tasks.build
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweet_path(@tweet), notice: "投稿しました。"
    else
      render 'new', notice: "入力してください。"
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
  end

  def update
    @tweet = Tweet.find(params[:id])
    @task = @tweet.tasks
    @user = User.find(@tweet.user_id)

    if @tweet.update(tweet_params)
      #更新した内容にタスクのステータスが２の完了が含まれるとき
      #レベル上限は100
      if @task.where(status: 2).exists? && @user.level <= 100
        level_up
      end
      redirect_to tweet_path(@tweet), notice: "更新しました。"
    else
      render 'tweets/edit', alert: "必須項目があります。"
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to user_path(current_user), alert: '投稿を削除しました。'
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body, tasks_attributes: [:id, :task_name, :status, :_destroy])
    end

    # レベルアップの処理
    def level_up
      #変数に現在のユーザーの経験値を代入
      totalExp = @user.experience_point
      #得られた経験値をユーザーの経験値に加算
      #１タスク１０ｐｔで設定
      totalExp += @task.where(status: 2).count * 10
      #加算した経験値をuserの総経験値を示す変数に再代入
      @user.experience_point = totalExp
      #更新の処理
      @user.update(experience_point: totalExp)
      #レベルセッティングのモデルから、今の自分のレベルより1高いレコードを探し代入
      levelSetting = LevelSetting.find_by(level: @user.level + 1);

      #探してきたレコードの閾値よりもユーザーの総経験値が高かった場合
      if levelSetting.thresold <= @user.experience_point
        #レベルを1増やして更新
        @user.level = @user.level + 1
        @user.update(level: @user.level)
      end
    end
end

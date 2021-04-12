class TweetsController < ApplicationController
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
      render 'new', notice: "入力してください"
    end

  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  def edit
    @tweet = Tweet.find(params[:id])

  end

  def update
    @tweet = Tweet.find(params[:id])
    @task = @tweet.tasks
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet), notice: "更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    # @tweet = Tweet.find(params[:id])
    # @tweet.destroy
    # redirect_to tweets_path

    Tweet.find(params[:id]).destroy
    redirect_to user_path(current_user), alert: '投稿を削除しました'
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body, tasks_attributes: [:id, :task_name, :done, :_destroy])
    end
end

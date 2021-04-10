class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
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

  def update

  end

  def destroy

  end

  private

    def tweet_params
      params.require(:tweet).permit(:body, tasks_attributes: [:id, :task_name, :done, :_destroy])
    end
end

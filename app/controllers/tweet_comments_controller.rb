class TweetCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_comment = current_user.tweet_comments.new(tweet_comment_params)
    @tweet_comment.tweet_id = @tweet.id
    if @tweet_comment.save
      redirect_to tweet_path(@tweet)
    else
      @user = @tweet.user
      render "tweets/show", alert: "コメントを入力してください"
    end
  end

  def destroy
    @tweet_comment = TweetComment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
    redirect_to request.referer
  end

  private
    def tweet_comment_params
      params.require(:tweet_comment).permit(:comment)
    end
end

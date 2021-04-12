class CheersController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    cheer = current_user.cheers.new(tweet_id: @tweet.id)
    cheer.save
  end
  
  def destroy
    @tweet = Tweet.find(params[:tweet_id])
  	cheer = current_user.cheers.find_by(tweet_id: @tweet.id)
  	cheer.destroy
  end
end
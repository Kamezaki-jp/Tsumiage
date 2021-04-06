class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    
    if @tweet.save
      redirect_to tweets_path
    else
      
    end
  end
  
  def show
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end

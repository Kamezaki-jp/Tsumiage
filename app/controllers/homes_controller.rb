class HomesController < ApplicationController
  def top
  end

  def users_ranking
    @users = User.joins(tweets: :tasks).where(tasks: {status: 2}).group("users.name").order('count(tasks.status) desc')
  end
end

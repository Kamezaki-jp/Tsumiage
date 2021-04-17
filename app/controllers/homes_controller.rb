class HomesController < ApplicationController
  def top
  end

  def overall_ranking
    @users = User.joins(tweets: :tasks).where(tasks: {status: 2}).limit(10).group("users.name").order('count(tasks.status) desc')
  end

  def daily_ranking
    @users = User.joins(tweets: :tasks).where(tasks: {status: 2}).where(tasks: {updated_at: Time.now.all_day}).limit(10).group("users.name").order('count(tasks.status) desc')
  end

  def weekly_ranking
    @users = User.joins(tweets: :tasks).where(tasks: {status: 2}).where(tasks: {updated_at: Time.now.all_week}).limit(10).group("users.name").order('count(tasks.status) desc')
  end

  def monthly_ranking
    @users = User.joins(tweets: :tasks).where(tasks: {status: 2}).where(tasks: {updated_at: Time.now.all_month}).limit(10).group("users.name").order('count(tasks.status) desc')
  end
end

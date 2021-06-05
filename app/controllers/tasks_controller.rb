class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_parmas)
    redirect_to tweets_path if @task.save
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:body, :tweet_id)
  end
end

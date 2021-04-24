class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    #どちらのモデルからデータを取るか
    @model = params["model"]
    # 検索バーの入力内容
    @content = params["content"]
    @records = search_for(@model, @content)
  end

  private
    def search_for(model, content)
      if model == 'user'
        User.where('name LIKE ?', '%'+content+'%').order(created_at: :desc)
      elsif model == 'tweet'
        Tweet.where('body LIKE ?', '%'+content+'%').order(created_at: :desc)
      end
    end
end

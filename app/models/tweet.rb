class Tweet < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many   :tasks,          dependent: :destroy
  has_many   :cheers,         dependent: :destroy
  has_many   :tweet_comments, dependent: :destroy
  # バリデーション
  validates :body, length: { maximum: 140 }, presence: true
  # ツイートとタスクのネスト
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  # cheerテーブルにユーザーのIDが存在するかどうか
  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end
end

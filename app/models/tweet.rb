class Tweet < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many   :tasks,  dependent: :destroy
  has_many   :cheers, dependent: :destroy
  # バリデーション
  validates :body, presence: true
  # ツイートとタスクのネスト
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  
  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end
end

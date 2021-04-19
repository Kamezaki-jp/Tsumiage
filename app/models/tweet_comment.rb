class TweetComment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :comment, presence: true, length: {maximum: 100}
end

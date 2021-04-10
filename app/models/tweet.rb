class Tweet < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :body, presence: true
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end

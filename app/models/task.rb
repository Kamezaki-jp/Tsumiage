class Task < ApplicationRecord
  belongs_to :tweet

  validates :task_name, presence: true

  # タスクステータス
  enum status: { 未実施: 0, 積み上げ中: 1, 積み上げ完了: 2 }
end

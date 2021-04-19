class Task < ApplicationRecord
  belongs_to :tweet

  validates :task_name, presence: true

  # タスクステータス
  enum status: { 未完了: 0 , 作業中: 1, 完了: 2 }

end

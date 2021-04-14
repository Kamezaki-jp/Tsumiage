class Task < ApplicationRecord
  # belongs_to :user
  belongs_to :tweet
  
enum status: { 未完了: 0 , 作業中: 1, 完了: 2 }

end

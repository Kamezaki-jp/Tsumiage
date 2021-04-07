class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :tweets
  has_many :tasks

  attachment :profile_image

  #ゲストログインのメソッド
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      # ランダムパスワードの作成
      user.password = SecureRandom.urlsafe_base64
    end
  end
end

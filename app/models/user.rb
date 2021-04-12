class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets,  dependent: :destroy
  has_many  :cheers, dependent: :destroy

  has_many  :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many  :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many  :following_user,  through: :follower, source: :followed
  has_many  :follower_user,   through: :followed, source: :follower

  attachment :profile_image

  validates :name, presence: true, length: {minimum: 2, maximum: 20},uniqueness: true
  validates :introduction,length: {maximum: 100}

  # フォローモデルメソッド
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  #ゲストログインのメソッド
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      # ランダムパスワードの作成
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.introduction = "こちらは閲覧用のゲストアカウントです。"
    end
  end
end

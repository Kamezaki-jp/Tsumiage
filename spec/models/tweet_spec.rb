require 'rails_helper'

RSpec.describe 'Tweetモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tweet.valid? }

    let(:user) { create(:user) }
    let!(:tweet) { build(:tweet, user_id: user.id) }

    context 'bodyカラム' do
      it '空欄でないこと' do
        tweet.body = ''
        is_expected.to eq false
      end
      it '140文字以下であること: 140文字は〇' do
        tweet.body = Faker::Lorem.characters(number: 140)
        is_expected.to eq true
      end
      it '140文字以下であること: 141文字は×' do
        tweet.body = Faker::Lorem.characters(number: 141)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Tweet.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end

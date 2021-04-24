5.times do |n|
    User.create!(
     email: "test#{n + 1}@test.com",
     name: "テストユーザー#{n + 1}",
     password: "111111",
     introduction: "テストユーザー#{n + 1}です。",
    )
  end

100.times do |n|
  LevelSetting.create!(
    level: 2 + n ,
    thresold: 100 * ( n + 1 )
  )
end
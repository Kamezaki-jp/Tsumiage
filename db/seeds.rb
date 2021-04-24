# レベルの情報
100.times do |n|
  LevelSetting.create!(
    level: 2 + n ,
    thresold: 100 * ( n + 1 )
  )
end
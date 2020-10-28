# # ユーザーのデータ
10.times do |n|
  name  = "User-#{n+1}"
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# 質問のデータ
Question.create(title: 'Windowsエラー', content: 'Windowsエラー', user_id: 1)
Question.create(title: 'Lunuxエラー', content: 'Lunuxエラー', user_id: 2)
Question.create(title: 'Oracleエラー', content: 'Oracleエラー', user_id: 3)
Question.create(title: 'スクリプトエラー', content: 'スクリプトエラー', user_id: 4)
Question.create(title: 'コンパイルエラー', content: 'コンパイルエラー', user_id: 5)

# 回答のデータ
10.times do |n|
  content = "Answer-#{n+1}"
  user_id = rand(1..10)
  question_id = rand(1..5)
  Answer.create!(content: content,
               user_id: user_id,
               question_id:  question_id)
end

# ブックマークのデータ
10.times do |n|
  user_id = rand(1..10)
  question_id = rand(1..5)
  Bookmark.create!(user_id: user_id,
                question_id:  question_id)
end

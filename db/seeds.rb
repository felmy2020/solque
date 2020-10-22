# ユーザーのデータ
10.times do |n|
  name  = "example-#{n+1}"
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# 質問のデータ
10.times do |n|
  title  = "Question-#{n+1}"
  content = "Question-#{n+1}"
  user_id = rand(1..10)
  Question.create!(title:  title,
               content: content,
               user_id: user_id)
end

# 回答のデータ
10.times do |n|
  content = "Answer-#{n+1}"
  user_id = rand(1..10)
  question_id = rand(1..10)
  Answer.create!(content: content,
               user_id: user_id,
               question_id:  question_id)
end

# ブックマークのデータ
10.times do |n|
  user_id = rand(1..10)
  question_id = rand(1..10)
  Bookmark.create!(user_id: user_id,
                question_id:  question_id)
end

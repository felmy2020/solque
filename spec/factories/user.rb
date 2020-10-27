FactoryBot.define do
  factory :user do
    name { 'test1名前' }
    email { 'test1@example.com' }
    password { 'test01' }
    password_confirmation { 'test01' }
  end
  factory :user2, class: User do
    name { 'test2名前' }
    email { 'test2@example.com' }
    password { 'test02' }
    password_confirmation { 'test02' }
  end
end

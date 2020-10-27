require 'rails_helper'
describe '回答モデル機能', type: :model do

  describe 'バリデーションのテスト' do
    context '内容が空の場合' do
      it 'バリデーションにひっかる' do
        user =  FactoryBot.create(:user)
        question = Question.create(title: '成功テスト', content: '成功テスト', user_id: user.id)
        answer = Answer.create(content: '', user_id: user.id, question_id: question.id)
        expect(answer).not_to be_valid
      end
    end
    context '内容が記載されている場合' do
      it 'バリデーションが通る' do
        user =  FactoryBot.create(:user)
        question = Question.create(title: '成功テスト', content: '成功テスト', user_id: user.id)
        answer = Answer.create(content: '成功テスト', user_id: user.id, question_id: question.id)
        expect(answer).to be_valid
      end
    end
  end
end

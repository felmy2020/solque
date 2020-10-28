require 'rails_helper'
describe '質問モデル機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかる' do
        user =  FactoryBot.create(:user)
        question = Question.new(title: '', content: '失敗テスト', user_id: user.id)
        expect(question).not_to be_valid
      end
    end
    context '詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        user =  FactoryBot.create(:user)
        question = Question.new(title: '失敗テスト', content: '', user_id: user.id)
        expect(question).not_to be_valid
      end
    end
    context '質問のタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        user =  FactoryBot.create(:user)
        question = Question.new(title: '成功テスト', content: '成功テスト', user_id: user.id)
        expect(question).to be_valid
      end
    end
  end
end

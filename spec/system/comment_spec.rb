require 'rails_helper'
RSpec.describe 'コメント管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question, user: user) }
  let!(:answer) { FactoryBot.create(:answer, user: user, question: question) }
  let!(:comment) { FactoryBot.create(:comment, user: user, answer: answer) }
  describe 'コメント作成機能' do
    before do
      visit root_path
      click_on 'ログイン'
      fill_in 'user_email', with: 'test1@example.com'
      fill_in 'user_password', with: 'test01'
      click_button 'ログイン'
    end
    context 'コメントに対して回答を投稿した場合' do
      it '作成したコメントが表示される' do
        visit question_path(question.id)
        fill_in :comment_content, with: 'コメント２'
        click_on "登録する"
        expect(page).to have_content 'コメント２'
      end
    end
  end

  describe 'コメント表示機能' do
    context '任意の質問詳細画面に遷移した場合' do
      it '作成済みの回答が表示される' do
        visit question_path(question.id)
        expect(page).to have_content 'コメント１'
      end
    end
  end
end

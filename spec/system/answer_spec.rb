require 'rails_helper'
RSpec.describe '回答管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question, user: user) }
  let!(:answer) { FactoryBot.create(:answer, user: user, question: question) }
  describe '新規作成機能' do
    before do
      visit root_path
      click_on 'ログイン'
      fill_in 'user_email', with: 'test1@example.com'
      fill_in 'user_password', with: 'test01'
      click_button 'ログイン'
    end
    context '質問に対して回答を投稿した場合' do
      it '作成した回答が表示される' do
        visit question_path(question.id)
        fill_in :answer_content, with: '回答２'
        click_on "投稿"
        expect(page).to have_content '回答２'
      end
    end
  end

  describe '詳細表示機能' do
    before do
      visit root_path
      click_on 'ログイン'
      fill_in 'user_email', with: 'test1@example.com'
      fill_in 'user_password', with: 'test01'
      click_button 'ログイン'
    end

    context '質問の詳細画面に遷移した場合' do
      it '作成済みの回答が表示される' do
        visit question_path(question.id)
        expect(page).to have_content '回答１'
      end
    end
  end
end

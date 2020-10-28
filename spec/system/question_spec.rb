require 'rails_helper'
RSpec.describe '質問管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question, user: user) }
  describe '新規作成機能' do
    before do
      visit root_path
      click_on 'ログイン'
      fill_in 'user_email', with: 'test1@example.com'
      fill_in 'user_password', with: 'test01'
      click_button 'ログイン'
    end
    context '質問を新規作成した場合' do
      it '作成した質問が表示される' do
        visit new_question_path
        fill_in :question_title, with: '質問２'
        fill_in :question_content, with: '質問詳細２'
        click_on "決定"
        expect(page).to have_content '質問２'
        expect(page).to have_content '質問詳細２'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      visit root_path
      click_on 'ログイン'
      fill_in 'user_email', with: 'test1@example.com'
      fill_in 'user_password', with: 'test01'
      click_button 'ログイン'
    end

    context '一覧画面に遷移した場合' do
      it '作成済みの質問一覧が表示される' do
        expect(page).to have_content '質問１'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意の質問詳細画面に遷移した場合' do
      it '該当質問の内容が表示される' do
        visit question_path(question.id)
        expect(page).to have_content '質問詳細１'
      end
    end
  end

  describe '検索機能' do
    before do
      visit root_path
    end

    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含む質問のタイトルで絞り込まれる" do
        fill_in :q_title_or_content_cont_all, with: '質問１'
        click_on '検索'
        expect(page).to have_content '質問１'
      end

      it "検索キーワードを含む質問の内容で絞り込まれる" do
        fill_in :q_title_or_content_cont_all, with: '質問詳細１'
        click_on '検索'
        expect(page).to have_content '質問１'
      end

      it "複数検索キーワードを含む質問の内容で絞り込まれる" do
        fill_in :q_title_or_content_cont_all, with: '質問詳細１ エラー'
        click_on '検索'
        expect(page).to have_content '質問１'
      end
    end
  end
end

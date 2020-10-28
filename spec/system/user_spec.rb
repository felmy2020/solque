require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do

  let!(:user) { FactoryBot.create(:user) }

  describe '新規作成機能テスト' do
    context 'ユーザーを新規作成した場合' do
      it 'アカウントが登録できる' do
        visit root_path
        click_on 'サインアップ'
        fill_in 'user_name', with: 'test_user'
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
    context '既存のユーザーがログインした場合' do
      it 'ログインが出来る' do
        visit root_path
        click_on 'ログイン'
        fill_in 'user_email', with: 'test1@example.com'
        fill_in 'user_password', with: 'test01'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'ログアウトをボタンを押した場合' do
      it 'ログアウトできること' do
        visit root_path
        click_on 'ログイン'
        fill_in "user_email", with: 'test1@example.com'
        fill_in "user_password", with: 'test01'
        click_button "ログイン"
        click_on "ログアウト"
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end

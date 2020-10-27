
require 'rails_helper'
describe 'ユーザ登録機能', type: :model do
  describe 'バリデーションのテスト' do
    context '全てが満たされている場合' do
      it 'バリデーションが通る' do
        user = User.new(
            name: 'test01',
            email: 'test01@test.com',
            password: "aaaaaa",
            password_confirmation: "aaaaaa"
        )
        expect(user).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(
            name: '',
            email: 'test01@test.com',
            password: "aaaaaa",
            password_confirmation: "aaaaaa"
        )
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(
            name: 'test01',
            email: '',
            password: "aaaaaa",
            password_confirmation: "aaaaaa"
        )
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(
            name: 'test01',
            email: 'test01@test.com',
            password: "",
            password_confirmation: ""
        )
        expect(user).not_to be_valid
      end
    end
  end
end
